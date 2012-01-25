require 'sinatra/base'

module Sinatra
  module AuthHelpers
      def hash_to_query_string(hash)
        hash.collect {|k,v| "#{k}=#{v}"}.join('&')
      end
  
      def login_required
        if session[:user]
          return true
        else
          session[:return_to] = request.fullpath
          redirect '/sign_in'
          return false
        end
      end

      def current_user
        if session[:user]
          User.first(conditions: { id: session[:user] })
        else
          nil
        end
      end

      def logged_in?
        !!session[:user]
      end
    end
    helpers AuthHelpers
end