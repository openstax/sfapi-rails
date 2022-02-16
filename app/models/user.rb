require 'byebug'
class User

  def initialize(uuid)
    @uuid = uuid
    Sentry.set_user(id: uuid)
  end

  def contact
    #byebug
    @contact = Contact.fetch_by_uuid(@uuid)
  end

  def opportunities
    opportunities = Opportunity.where(accounts_uuid: @uuid)
    if opportunities.blank?
      sf_opportunities = OpenStax::Salesforce::Remote::Opportunity.where(accounts_uuid: @uuid)
      sf_opportunities.each do |sf_opportunity|
        Opportunity.cache_local(sf_opportunity)
      end
    end
    opportunities = Opportunity.where(accounts_uuid: @uuid)
    opportunities
  end

  def leads
    leads = Lead.where(accounts_uuid: @uuid)
    unless leads.exists?
      sf_leads = OpenStax::Salesforce::Remote::Lead.where(accounts_uuid: @uuid)
      sf_leads.each do |sf_lead|
        Lead.cache_local(sf_lead)
      end
    end
    leads = Lead.where(accounts_uuid: @uuid)
    leads
  end

  def schools
    AccountContactRelation.where(contact_id: @contact.salesforce_id)
  end

  def subscriptions
    Subscription.where(contact_id: @contact.id)
  end
end
