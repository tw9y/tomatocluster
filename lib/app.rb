require 'sinatra'
require 'require_all'
require_relative 'sinatra/auth_helpers'
require 'sinatra/flash'
require_all 'models'

module TomatoCluster
	class App < Sinatra::Base
		use Rack::Session::Cookie
    helpers Sinatra::AuthHelpers
    register Sinatra::Flash

		configure do
			set :views, './views'
		end

    get '/' do
      if current_user
        haml :dashboard 
      else
        haml :startpage
      end
    end

    get '/users' do
      #login_required
      #redirect "/" unless current_user.admin?

      @users = User.all
      if @users != []
        haml :"users/index"
      else
        redirect '/sign_up'
      end
    end

    get '/users/:id/delete' do
      login_required
      redirect "/users" unless current_user.admin? || current_user.id.to_s == params[:id]

      if User.delete(params[:id])
        flash[:notice] = "User deleted."
      else
        flash[:notice] = "Deletion failed."
      end
      redirect '/'
    end
    
    get '/sign_in' do
      if current_user
        redirect '/'
      else
        haml :"users/sign_in"
      end
    end
    
    post '/sign_in' do
      if user = User.authenticate(params[:email], params[:password])
        session[:user] = user.id
        flash[:notice] = "Login successful."

        if session[:return_to]
          redirect_url = session[:return_to]
          session[:return_to] = false
          redirect redirect_url
        else
          redirect '/'
        end
      else
        flash[:notice] = "The email or password you entered is incorrect."
        redirect '/sign_in'
      end
    end
    
    get '/sign_out' do
      session[:user] = nil
      flash[:notice] = "Logout successful."
      redirect '/'
    end

    get '/sign_up' do
      if session[:user]
        redirect '/'
      else
        haml :"users/sign_up"
      end
    end
    
    post '/sign_up' do
      @user = User.create(params[:user])
      if @user.valid? && @user.id
        session[:user] = @user.id
        flash[:notice] = "Account created."
        redirect '/'
      else
        flash[:notice] = "There were some problems creating your account: #{@user.errors.full_messages}."
        # FIXME: do this some other way
        #redirect '/sign_up?' + hash_to_query_string(params['user'])
        redirect "sign_up?email=#{params['user']['email']}"
      end
    end

		def self.new(*)
			super
		end
	
	end
end