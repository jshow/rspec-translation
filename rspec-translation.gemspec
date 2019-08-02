# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/translation/version'

Gem::Specification.new do |spec|
  spec.name = 'rspec-translation'
  spec.version = Rspec::Translation::VERSION
  spec.authors = ['Gerry Power']
  spec.email = ['gerry@thepowerhouse.com']

  spec.summary = 'Rspec plugin to test i18n model translations'
  spec.homepage = 'https://github.com/gerrypower/rspec-translation'
  spec.license = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/gerrypower/rspec-translation/CHANGELOG.md'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'i18n', '~> 1.0'
  spec.add_dependency 'rspec', '~> 3.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'bundler-audit', '0.6.1'
  spec.add_development_dependency 'guard', '~> 2.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.0'
  spec.add_development_dependency 'guard-rubocop', '~> 1.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '0.73.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.34'
  spec.add_development_dependency 'simplecov', '0.17.0'
end
