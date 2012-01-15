
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
