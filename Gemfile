source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'cloudinary'
gem 'devise'
gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
gem 'figaro'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'rails_admin', '~> 2.0'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rexml'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rubocop', '>= 1.0', '< 2.0'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'listen', '~> 3.3'
  gem 'rack-livereload'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'rspec'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f'
