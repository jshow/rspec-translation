# Rspec::Translation

[![Maintainability](https://api.codeclimate.com/v1/badges/6349f2944ae10b03e9fa/maintainability)](https://codeclimate.com/github/gerrypower/rspec-translation/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/6349f2944ae10b03e9fa/test_coverage)](https://codeclimate.com/github/gerrypower/rspec-translation/test_coverage) [![CircleCI](https://circleci.com/gh/gerrypower/rspec-translation.svg?style=svg)](https://circleci.com/gh/gerrypower/rspec-translation) 



Rspec::Translation is a [rspec](https://github.com/rspec/rspec) plugin that allows TDD of your translation process on ruby objects. It requires the [i18n](https://github.com/ruby-i18n/i18n) gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-translation'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-translation

## Usage

```ruby
describe Commerce::CardErrorMsg, type: :model do
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

Bug reports and pull requests are welcome on GitHub at https://github.com/gerrypower/rspec-translation. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rspec::Translation project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rspec-translation/blob/master/CODE_OF_CONDUCT.md).
