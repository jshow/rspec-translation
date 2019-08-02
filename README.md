# Rspec::Translation

[![Gem Version](https://badge.fury.io/rb/rspec-translation.svg)](https://badge.fury.io/rb/rspec-translation) [![Maintainability](https://api.codeclimate.com/v1/badges/6349f2944ae10b03e9fa/maintainability)](https://codeclimate.com/github/gerrypower/rspec-translation/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/6349f2944ae10b03e9fa/test_coverage)](https://codeclimate.com/github/gerrypower/rspec-translation/test_coverage) [![CircleCI](https://circleci.com/gh/gerrypower/rspec-translation.svg?style=svg)](https://circleci.com/gh/gerrypower/rspec-translation) 



Rspec::Translation is a [rspec](https://github.com/rspec/rspec) plugin that allows TDD of your translation process on ruby objects. It requires the [i18n](https://github.com/ruby-i18n/i18n) gem.

Test change

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-translation', '~> 1.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-translation

## Usage

```ruby
describe Commerce::CardErrorMsg, type: :model do
  let(:view_context) { StubViewContext.new }
  let(:error_message) { 'a card error' }
  let(:code) { 'a card decline code' }
  let(:error) { { message: error_message, code: code } }

  subject(:sut) { described_class.new(view_context, error) }

  describe 'message' do
    subject { sut['message'] }

    it { should have_a_translation }
    it { should translate_with('commerce.card_error.message', message: error_message, code: code) }
  end

  describe 'action' do
    subject { sut['action'] }

    it { should have_a_translation }
    it { should translate_with('commerce.card_error.action') }
  end
end
```



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gerrypower/rspec-translation. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://www.contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rspec::Translation project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/gerrypower/rspec-translation/blob/master/CODE_OF_CONDUCT.md).

## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0](http://semver.org/). Violations of this scheme should be reported as
bugs. Specifically, if a minor or patch version is released that breaks backward compatibility, that
version should be immediately yanked and/or a new version should be immediately released that restores
compatibility. Breaking changes to the public API will only be introduced with new major versions. As a
result of this policy, once this gem reaches a 1.0 release, you can (and should) specify a dependency on
this gem using the [Pessimistic Version Constraint](https://guides.rubygems.org/patterns/#pessimistic-version-constraint) with
two digits of precision. For example:

```ruby
spec.add_dependency 'rspec-translation', '~> 1.0'
```

