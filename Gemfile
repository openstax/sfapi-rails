source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Rails framework
gem 'rails', '~> 6.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# Get env variables from .env file
gem 'dotenv-rails'

# JavaScript asset compiler
gem 'mini_racer'

# JavaScript asset compressor
gem 'uglifier'

# OpenStax Accounts SSO
gem 'openstax_auth', github: 'openstax/auth-rails', ref: 'ed2d7da86ca226b93376955b9474c4cf115c611f'

# Respond to ELB healthchecks in /ping and /ping/
gem 'openstax_healthcheck'

# OpenStax Salesforce helpers
gem 'openstax_salesforce'

# Ruby interface to Salesforce
gem 'restforce', '~> 5.0.5'

# Utilities for OpenStax websites
gem 'openstax_utilities'

# PostgreSQL database
gem 'pg'

# Threaded application server
gem 'puma'

# Prevent server memory from growing until OOM
gem 'puma_worker_killer'

# CORS for local testing/dev
gem 'rack-cors'

#XML Utilities
gem 'rexml'
gem 'multi_json'

# Pardot integration
gem 'ruby-pardot'

# Support systemd Type=notify services for puma and delayed_job
gem 'sd_notify'
gem 'sass-rails'

# Scout Integration
gem 'scout_apm'

# Sentry integration
gem 'sentry-rails'
gem 'sentry-ruby'
gem "sentry-sidekiq"

# sidekiq for background jobs
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sidekiq-status'
gem 'sidekiq-unique-jobs'
gem "sidekiq-cron", "~> 1.1"
gem "sidekiq-enqueuer", github: "umbrellio/sidekiq-enqueuer"

# Version Rails RESTful APIs
gem 'versionist'

# Pagination
gem 'will_paginate', '~> 3.3.0'

# Key-value store for caching
gem 'redis'

# business intel package - database insight
gem 'blazer'

# swagger for API docs
gem 'rswag'

# TODO: moving this outside the test group to see if it fixes an issue.. but it's probably an issue in the deployment
# Use RSpec for tests
gem 'rspec-rails'

group :development, :test do
  # Call 'debugger' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', require: false

  # Fixture replacement
  gem 'factory_bot_rails'

  # code linting
  gem 'rubocop', require: false

  # fake data generation
  gem 'faker'

  # Codecov integration
  gem 'codecov', require: false

  # Speedup and run specs when files change
  gem 'spring'
  gem 'spring-commands-rspec'

  # swagger api docs
  gem 'rswag-specs'

  # Show failing parallel specs instantly
  gem 'rspec-instafail'

  # Add ability to test sidekiq
  gem 'rspec-sidekiq'

  # Test database cleanup gem with multiple strategies
  gem 'database_cleaner'

  # Run specs in parallel
  gem 'parallel_tests'

  # Stubs HTTP requests
  gem 'webmock'

  # Records HTTP requests
  gem 'vcr'
end

group :development do
  # See updates in development to reload rails
  gem 'listen'
end

group :production, :test do
  # AWS SES integration
  gem 'aws-sdk-rails'
end

group :production do
  # Used to backup the database before migrations
  gem 'aws-sdk-rds', require: false

  # Used to record a lifecycle action heartbeat after creating the RDS snapshot before migrating
  gem 'aws-sdk-autoscaling', require: false

  # Used to send custom delayed_job metrics to Cloudwatch
  gem 'aws-sdk-cloudwatch', require: false

  # Consistent logging
  gem 'lograge'
end
