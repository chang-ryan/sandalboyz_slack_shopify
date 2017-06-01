# frozen_string_literal: true

source 'https://rubygems.org'

gem 'active_model_serializers'
gem 'dotenv-rails', groups: %i[development test]
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.1'
gem 'shopify_api'

group :development, :test do
  gem 'pry-byebug', platform: :mri
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rspec_api_documentation'
  gem 'rubocop', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'fabrication'
  gem 'faker'
  gem 'jsonpath'
  gem 'raddocs'
  gem 'sinatra', '~>2.0.0.beta2'
  gem 'timecop'
  gem 'webmock'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
