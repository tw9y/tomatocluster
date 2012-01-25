require 'bundler'
require 'uri'
Bundler.setup

Bundler.require(:default, ENV["RACK_ENV"].to_sym)

Dir["./lib/**/*.rb"].each { |f| require f }

configure do
  set :haml, :attr_wrapper => '"'
end

configure :development do
  set :mongo_db, 'tomatocluster_dev'
end

configure :test do
  set :mongo_db, 'tomatocluster_test'
end

configure :production do
  if ENV['MONGOHQ_URL']
    mongo_uri = URI.parse(ENV['MONGOHQ_URL'])
    ENV['MONGOHQ_HOST'] = mongo_uri.host
    ENV['MONGOHQ_PORT'] = mongo_uri.port.to_s
    ENV['MONGOHQ_USERNAME'] = mongo_uri.user
    ENV['MONGOHQ_PASSWORD'] = mongo_uri.password
    ENV['MONGOHQ_DATABASE'] = mongo_uri.path.gsub("/", "")
  else
    set :mongo_db, 'tomatocluster_prod'
  end
end
