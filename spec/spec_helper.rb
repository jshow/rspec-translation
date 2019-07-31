# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'bundler/setup'
require 'rspec/translation'
require 'i18n'
require_relative 'support/i18n_helpers'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = %i[should expect]
  end

  config.include I18nHelpers
end

I18n.enforce_available_locales = false
I18n.config.available_locales = :en
