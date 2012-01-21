require 'sinatra'
require 'require_all'
require 'mongo/model'
require_all 'models'

module TomatoCluster
	class App < Sinatra::Base

		configure do
			set :views, './views'
		end

		get '/' do
			haml :startpage
		end

		def self.new(*)
			super
		end
	
	end
end