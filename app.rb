require 'sinatra'
require 'require_all'
require 'mongo/model'
require_all 'models'
require_relative 'config/environments'

get '/' do
  haml :startpage
end
