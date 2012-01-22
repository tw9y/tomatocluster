require 'sinatra'
require 'require_all'
require 'mongo/model'
require_all 'models'

module TomatoCluster
	class App < Sinatra::Base
		enable :sessions
    use OmniAuth::Strategies::Identity

		configure do
			set :views, './views'
		end

		#get '/' do
		#	haml :startpage
		#end

    helpers do
      def current_user
        @current_user ||= User.first(user_id: session[:user_id]) if session[:user_id]
      end
    end

    get '/' do
      #p current_user
      #if current_user
        # The following line just tests to see that it's working.
        #   If you've logged in your first user, '/' should load: "1 ... 1";
        #   You can then remove the following line, start using view templates, etc.
      #  current_user.id.to_s + " ... " + session[:user_id].to_s 
      #else
       # '<a href="/sign_up">create an account</a> or <a href="/sign_in">sign in with Twitter</a>'
        # if you replace the above line with the following line, 
        #   the user gets signed in automatically. Could be useful. 
        #   Could also break user expectations.
        # redirect '/auth/twitter'
      #end
    end

    get '/auth/:name/callback' do
      auth = request.env["omniauth.auth"]
      user = User.first_or_create({ :uid => auth["uid"]}, {
        :uid => auth["uid"],
        :name => auth["info"]["name"],
        :created_at => Time.now })
        session[:user_id] = user.id
        redirect '/'
      end

      ["/sign_in/?", "/signin/?", "/log_in/?", "/login/?", "/sign_up/?", "/signup/?"].each do |path|
        get path do
          redirect '/auth/identity'
        end
      end

      ["/sign_out/?", "/signout/?", "/log_out/?", "/logout/?"].each do |path|
        get path do
          session[:user_id] = nil
          redirect '/'
        end
      end

		def self.new(*)
			super
		end
	
	end
end