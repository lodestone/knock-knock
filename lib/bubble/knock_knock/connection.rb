require 'singleton'
require 'uri'
require 'net/http'
require 'net/https'

module Bubble
  module KnockKnock

    # This class make the connection between Ruby and Google.
    # It's a Singleton class, turning the management of the connection easier. Just one connection will be created during all your script.
    class Connection
      include Singleton
      include Bubble::KnockKnock
      include Bubble::KnockKnock::Exceptions
  
      attr_accessor :email, :service
      attr_reader :password, :auth

      # This method creates the connection. First of all it set up the environment to make the connection and after it stablish the connection with Google
      # The service should be (i.e.):
      # * [cp] Google Mail Contact Book
      # * [analytics] Google Analytics
      #
      # === Example
      #   require 'rubygems'
      #   require 'knock_knock'
      #   
      #   Bubble::KnockKnock::Connection.connect('email@gmail.com', 'password', 'cp')
      def connect(email, password, service)
        @email = email
        @password = password
        @service = service
    
        setup
        stablish
      end
  
      # Retrieve the Auth Token required for authentications on all Google Services.
      def auth
        @auth
      end

      protected
  
      # It gives the correct values to attributes and variables required to make the connection.
      def setup
        @uri = URI.parse('https://www.google.com/accounts/ClientLogin')
  
        @query = { 'accountType' => 'HOSTED_OR_GOOGLE',
                   'Email' => @email,
                   'Passwd' => @password,
                   'service' => @service,
                   'source' => APP_NAME }
                    
        @http = Net::HTTP.new(@uri.host, 443)
        @http.use_ssl = true
      end

      # Makes the connection with Google. If the login and password are wrong a BadLogin exception occurs.
      def stablish
        response, body = @http.post(@uri.path, @query.to_uri)
  
        case response.code.to_i
          when 403; raise BadLogin
          else; parse(body)
        end
      end

      # Gives the Auth Token from authentication request.
      def parse(body)
         @auth = body.match(/Auth=(.*)/)[1]
      end
    end
  end
end