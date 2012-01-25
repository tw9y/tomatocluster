source "http://rubygems.org"

gem "sinatra"
gem "sinatra-mongoid", :require => 'sinatra/mongoid'
gem "bson_ext"
gem "require_all"
gem "haml"
gem "sass"
gem "coffee-script"
gem 'sinatra-flash'

gem 'bcrypt-ruby', '~> 3.0.0'

group :test do
  gem "factory_girl"
  gem 'minitest' # this is a newer version than the one included in ruby 1.9
end

group :development do
  gem 'guard'
  gem 'guard-minitest', :git => 'git://github.com/aspiers/guard-minitest.git'
end
