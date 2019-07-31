# frozen_string_literal: true

require 'rspec/expectations'
require 'i18n'

RSpec::Matchers.define :have_a_translation do
  match do |translated_string|
    !translated_string.to_s.empty? &&
      !translated_string.start_with?('translation missing')
  end
  description do
    'have a translation'
  end
  failure_message do
    'missing or blank translation key'
  end
end

RSpec::Matchers.define :translate_with do |*args|
  match do |actual|
    actual == I18n.translate(*args)
  end
  failure_message do
    "expected translation: '#{actual}' but got '#{I18n.t(*args)}'\n"
  end
end
