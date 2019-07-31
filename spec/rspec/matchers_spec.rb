# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable Metrics/BlockLength
# rubocop:disable RSpec/DescribeClass
RSpec.describe 'matchers' do
  subject { I18n.t(key, variables) }

  let(:variables) { {} }

  context 'without an existing translation key' do
    let(:key) { 'no_translation' }

    it { is_expected.not_to have_a_translation }
  end

  context 'with a nil translation key' do
    let(:key) { nil }

    it { is_expected.not_to have_a_translation }
  end

  context 'with an existing translation key' do
    let(:key) { 'welcome.greeting' }

    before { store_translations(:en, welcome: { greeting: 'Hello' }) }

    it { is_expected.to have_a_translation }
    it { is_expected.to translate_with('welcome.greeting') }

    context 'with variable interpolation' do
      let(:variables) { { first_name: 'Gerry' } }
      let(:key) { 'welcome.personalized' }

      before do
        store_translations(:en, welcome:
        {
          personalized: 'Hello %{first_name}!'
        })
      end

      it { is_expected.to have_a_translation }
      it { is_expected.to translate_with('welcome.personalized', variables) }
    end

    context 'with pluralization' do
      let(:variables) { { count: 0 } }
      let(:key) { 'inbox' }

      before do
        store_translations(:en, inbox:
        {
          zero: 'no messages'
        })
      end

      it { is_expected.to have_a_translation }
      it { is_expected.to translate_with('inbox', variables) }
    end
  end
end
# rubocop:enable RSpec/DescribeClass
# rubocop:enable Metrics/BlockLength
