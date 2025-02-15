source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.1.0"

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# Use postgresql as de database for Active Record
gem "pg"

# Use Puma as the app server
gem "puma"
# Use SCSS for stylesheets
gem "sass-rails"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier"
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

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use slim to generate views
gem "slim-rails"

# Let's use bootstrap 4
gem "bootstrap", "~> 4.0.0"
gem "jquery-rails"

# forms and nested attributes
gem "simple_form"
gem "cocoon"

# countries data
gem "country_select" # , require: "country_select_without_sort_alphabetical"

# Validate dates
gem "validates_timeliness", "~> 5.0.0"


# Follow coding standards!
gem "rubocop", require: false
gem "rubocop-rails"
gem "rubocop-rspec"
gem "rubocop-factory_bot"


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
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
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "bootsnap"
