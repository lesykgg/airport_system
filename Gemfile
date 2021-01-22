# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'dotenv-rails', groups: [:development, :test]
gem 'bootsnap', '>= 1.4.2', require: false
gem 'datetimepicker-rails', github: 'zpaulovics/datetimepicker-rails', branch: 'master', submodules: true
gem 'devise', '~> 4.7.1'
gem 'haml-rails'
gem 'jbuilder', '~> 2.7'
gem 'jquery-rails'
gem 'momentjs-rails', '~> 2.9'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.1'
gem 'rename'
gem 'sass-rails', '>= 6'
gem 'simple_form', '~> 5.0.1'
gem 'turbolinks', '~> 5'
gem 'twitter-bootstrap-rails'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot'
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'railroady'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
