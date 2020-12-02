source 'https://rubygems.org'
ruby '2.5.1'

gem 'rails', '4.1.4'

### OpenShift Online changes:

# Fix the conflict with the system 'rake':

# Support for databases and environment.
# Use 'sqlite3' for testing and development and mysql and postgresql
# for production.
#
# To speed up the 'git push' process you can exclude gems from bundle install:
# For example, if you use rails + mysql, you can:
#
# $ rhc env set BUNDLE_WITHOUT="development test postgresql"
# 
# group :development, :test do
  # gem 'sqlite3', '~> 1.3.13'
  gem 'minitest'
  gem 'thor'
  gem 'annotate'
  gem "better_errors"
  gem 'pry'
  gem 'fcm'
  gem 'whenever', require: false
# end


# Add support for the MySQL
# group :production, do
  gem 'pg', '~> 0.11'
# end

 # gem 'pg' , '~> 0.21.0'
 # gem 'puma', '~> 3.7'
 gem 'unicorn' 
### / OpenShift changes

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
gem 'will_paginate'
gem 'activerecord-session_store'
gem 'rubyXL', "~> 3.4.3"
gem "spreadsheet"
gem "iconv", "~> 1.0.3"
gem 'roo'
gem 'roo-xls'
gem 'devise'
gem "paperclip"
gem 'rabl', '~>0.11.6'	
gem 'oj'
gem 'devise-token_authenticatable'
gem 'gcm'
gem "capistrano", "~> 3.11", require: false
gem 'capistrano-bundler', '~> 1.5'
gem 'capistrano-rails'
gem 'capistrano-rvm'
gem 'rvm1-capistrano3', require: false
gem 'capistrano3-unicorn'
gem 'delayed_job_active_record'
