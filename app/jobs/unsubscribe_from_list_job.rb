class UnsubscribeFromListJob < ApplicationJob
  queue_as :default

  def perform(subscription_id)
    @client = Pardot.client
    subscription = Subscription.find(subscription_id)

    return unless prospect_id = Pardot.salesforce_to_prospect(subscription.contact.salesforce_id)

    @client.list_memberships.delete(subscription.list.pardot_id, prospect_id)
    subscription.destroy
  end
end