source 'https://rubygems.org'

gem 'rails', '~> 5.1.1'
gem 'dotenv-rails', groups: [:development, :test]
gem 'puma', '~> 3.7'
gem 'shopify_api'
gem 'pg'

group :development, :test do
  gem 'pry-byebug', platform: :mri
  gem 'pry-rails'
  gem 'rubocop', require: false
  gem 'rspec-rails'
  gem 'rspec_api_documentation'
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
  gem 'webmock'
  gem 'raddocs'
  gem 'sinatra', '~>2.0.0.beta2'
  gem 'timecop'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
