# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

gem 'activeadmin'
gem 'bootsnap', require: false
gem 'devise'
gem 'foreman'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.2'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4', '>= 7.0.4.2'
gem 'ransack', '~> 4.0'
gem 'sassc'
gem 'simple_form'
gem 'simple_form-tailwind'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'
gem 'tzinfo-data',
    platforms: %i[mingw mswin x64_mingw jruby]
gem 'yaml'

group :development, :test do
  gem 'annotate'
  gem 'binding_of_caller'
  gem 'cpf_faker'
  gem 'database_cleaner'
  # gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'pry-byebug'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 4.0'
  gem 'rubocop', require: false
  gem 'rubocop-capybara'
  gem 'rubocop-factory_bot'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'rubycritic', require: false
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov'
  gem 'simplecov-json'
end

group :development do
  gem 'better_errors'
  gem 'letter_opener_web'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rack-mini-profiler', require: false
  gem 'rails_layout'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'rspec-benchmark'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
