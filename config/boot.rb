require 'bundler'
Bundler.setup

Bundler.require(:default, ENV["RACK_ENV"].to_sym)

Dir["./lib/**/*.rb"].each { |f| require f }

configure do
  set :haml, :attr_wrapper => '"'
end

configure :development do
  Mongo::Model.default_database_name = :tomatocluster_dev
end

configure :test do
  Mongo::Model.default_database_name = :tomatocluster_test
  Mongo::Model.default_database.clear
end

configure :production do
  Mongo::Model.default_database_name = :tomatocluster_prod
end
