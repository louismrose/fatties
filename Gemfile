# Edit this Gemfile to bundle your application's dependencies.
source 'http://gemcutter.org'


gem "rails", "3.0.0.rc"

## Bundle edge rails:
# gem "rails", :git => "git://github.com/rails/rails.git"

gem "mongoid", "2.0.0.beta.15"
gem "bson_ext", "1.0.4"

# Using my flutie fork until routes are updated and
# deprecation warning is removed
# Might need this to deploy in the meantime: http://docs.heroku.com/bundler100rc2-git
# gem 'flutie', '1.0.3'
gem 'flutie', :git => "git://github.com/louismrose/flutie.git"

group :test do
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'rspec-rails', '2.0.0.beta.19'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'chronic'
end

