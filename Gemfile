source 'https://rubygems.org'

ruby '2.2.1'

gem 'rails', '~> 4.2.0'
gem 'pg', '~> 0.18.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'coderay', '~> 1.1.0'
gem 'devise', '~> 3.4'
gem 'font-awesome-rails', '~> 4.3'
gem 'puma'
gem 'rack-timeout'

group :development do
  gem 'byebug'
  gem 'quiet_assets'
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'codeclimate-test-reporter', require: false
  gem 'minitest-rails'
  gem 'minitest-reporters'
  gem 'rake', require: false # required for Travis CI
  gem 'simplecov', '~> 0.9.2', require: false
end

group :development, :test do
  gem 'reek', require: false
  gem 'rubocop', require: false
  gem 'spring', require: false
end

group :production do
  gem 'rails_12factor'
end
