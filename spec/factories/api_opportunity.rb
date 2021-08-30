require 'faker'
require 'time'

FactoryBot.define do
  factory :api_opportunity, class: Opportunity do
    salesforce_id { '0064C00000DtyZIQAZ' }
    term_year { [ '2019 - 20 Spring', '2019 - 20 Fall', '2018 - 19 Fall', '2018 - 19 Spring'].sample }
    book_name { 'Managerial Accounting' }
    contact_id { '0034C00000Toa9PQAR' }
    new { false }
    close_date { Date.today - 2 }
    stage_name { 'Confirm Adoption Won' }
    update_type { 'Renewal - Verified' }
    number_of_students { Faker::Number.between(from: 1, to: 200) }
    student_number_status { 'Reported' }
    time_period { 'Year' }
    class_start_date { Date.today }
    school_id { '0014C00000aB0swQAC' }
    book_id { 'a0Z4C000002JXWSUA4' }
    lead_source { 'Web' }
  end
end
