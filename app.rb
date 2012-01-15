require 'sinatra'
require 'require_all'
require_relative 'config/environment'

get '/' do
  haml :startpage
end
