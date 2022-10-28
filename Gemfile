source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

gem 'better_errors', '~> 2.9', '>= 2.9.1' #error
gem 'bulma-rails', '~> 0.9.3' #css
gem 'simple_form', '~> 5.1' #forms

gem 'devise', '~> 4.8', '>= 4.8.1'

gem 'pundit', '~> 2.2'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary-edge', '~> 0.12.6.0'
gem 'bootstrap', '~> 5.2.2'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'image_processing', '~> 1.12', '>= 1.12.2'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem 'guard', '~> 2.18'
  gem 'guard-livereload', '~> 2.5', require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
