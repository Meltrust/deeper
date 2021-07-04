source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'binding_of_caller'

gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

gem 'jbuilder', '~> 2.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'devise'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'better_errors'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rubocop', '>= 1.0', '< 2.0'
end

group :development do
  gem 'guard'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'listen', '~> 3.3'
  gem 'rack-livereload'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rexml'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'rspec'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
