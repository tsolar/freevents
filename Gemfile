# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "dotenv-rails", require: "dotenv/rails-now"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.2"

# for railties app_generator_test
gem "bootsnap", ">= 1.1.0", require: false

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# Use postgresql as de database for Active Record
gem "pg", ">= 0.18", "< 2.0"

# Use Puma as the app server
gem "puma", "~> 3.7"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use slim to generate views
gem "slim-rails"

# Let's use bootstrap 4
gem "bootstrap", "~> 4.1.1"
gem "jquery-rails"

# let's use this gem until webpacker is used
gem "rails-assets-datetimepicker", source: "https://rails-assets.org"

# forms and nested attributes
gem "cocoon"
gem "simple_form"

# countries data
gem "country_select", require: "country_select_without_sort_alphabetical"

# Validate dates
gem "validates_timeliness", "~> 4.0"

# Follow coding standards!
gem "rubocop", require: false
gem "rubocop-rails", github: "rubocop-hq/rubocop-rails"
gem "rubocop-rspec"

# User authentication
gem "devise"

# Authorization
gem "pundit"
gem "pundit-matchers", "~> 1.4.1"

# Queue jobs and emails
gem "daemons"
gem "delayed_job_active_record"
gem "mailgun-ruby", "~>1.1.6"

gem "seed_migration"

# Generate QR codes!
gem "barby"
gem "rqrcode"

gem "wicked_pdf"

# translations
gem "devise-i18n"
gem "rails-i18n", "~> 5.1"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"

  gem "rspec-rails", "~> 3.5"
  gem "shoulda-matchers", "~> 3.1"

  # bring back 'assigns'
  gem "rails-controller-testing"

  gem "factory_bot_rails"
  gem "ffaker"

  # lets generate some layouts with bootstrap...
  gem "rails_layout"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  # Use Capistrano for deployment
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-measure", require: false
  gem "capistrano-rails", "~> 1.3", require: false
  gem "capistrano-rvm"
  gem "capistrano3-delayed-job"
  gem "capistrano3-postgres", require: false
  gem "capistrano3-puma"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
