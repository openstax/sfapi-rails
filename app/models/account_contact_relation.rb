class AccountContactRelation < ApplicationRecord
  has_one :school
  has_one :contact

  before_validation :ensure_school_exists_in_api

  validates_uniqueness_of :contact_id, scope: :school_id

  # expects an object of type
  # OpenStax::Salesforce::Remote::AccountContactRelation
  def self.cache_local(sf_relation)
    relation = AccountContactRelation.find_or_initialize_by(contact_id: sf_relation.contact_id, school_id: sf_relation.school_id)
    relation.salesforce_id = sf_relation.id
    relation.contact_id = sf_relation.contact_id
    relation.school_id = sf_relation.school_id
    relation.primary = sf_relation.primary

    relation.save if relation.changed?
  end

  private

  def ensure_school_exists_in_api
    return if School.exists?(salesforce_id: self.school_id)
    sf_school = OpenStax::Salesforce::Remote::School.find_by(id: self.school_id)
    if sf_school
      School.cache_local(sf_school)
    else
      # TODO: Let's just make the school...? Although this should not be happening unless it's a cross-env issue
      # for now, making sure this error is raised on prod and staging - will ignore on dev/qa
      if Rails.application.is_real_production?  || Rails.application.is_staging?
        raise(SchoolDoesNotExistInSalesforce)
      else
        warn('School does not exist in Salesforce, likely because this is a sandbox.')
      end
    end
  end
end
