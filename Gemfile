source 'https://rubygems.org'

gem 'rails', '4.2.3'
gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

gem 'therubyracer', platforms: :ruby
gem 'jquery-ui-rails'
gem 'simple_form', git: 'https://github.com/plataformatec/simple_form.git', branch: 'master'
gem 'wobapphelpers', git: 'https://github.com/swobspace/wobapphelpers', branch: 'master'
gem 'wobauth', git: 'https://github.com/swobspace/wobauth.git', branch: 'master'
gem 'cancancan', '~> 1.12.0'
gem 'settingslogic'
gem 'select2-rails'
gem 'data-confirm-modal', git: 'https://github.com/ifad/data-confirm-modal.git'
gem 'bower-rails', '~> 0.10.0'

group :development do
  gem 'thin'
  gem 'guard'
  gem 'guard-livereload', require: false
  gem 'guard-rails'
  gem 'guard-bundler'
  gem 'libnotify'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'dotenv'
  gem 'guard-rspec', require: false
end

group :test do
  gem 'shoulda-matchers',require: false
  gem 'factory_girl_rails'
  gem 'database_rewinder'
  gem 'capybara'
  gem 'poltergeist'
end

group :production do
  gem 'mysql2'
end
