require 'rails_helper'
Sidekiq::Testing.inline!

RSpec.describe SyncPardotProspectsAndSubscriptionsJob, type: :job do
  it { is_expected.to be_processed_in :default }
  it { is_expected.to be_retryable 2 }
end
