require 'singleton'
require 'uri'
require 'net/http'
require 'net/https'

module Bubble
  module KnockKnock
    class Connection
      include Singleton
    
      attr_accessor :email, :password, :service, :auth
    
      def connect(email, password, service)
        @email = email
        @password = password
        @service = service
      
        setup!
        stablish!
      end
    
      def setup!
        @uri = URI.parse('https://www.google.com/accounts/ClientLogin')
      
        @query = { 'accountType' => 'GOOGLE',
                   'Email' => @email,
                   'Passwd' => @password,
                   'service' => @service,
                   'source' => APP_NAME }
                        
        @http = Net::HTTP.new(@uri.host, 443)
        @http.use_ssl = true
      end
    
      def stablish!
        response, body = @http.post(@uri.path, @query.to_uri)
      
        case response.code.to_i
          when 403; raise BadLogin
          else; parse!(body)
        end
      end
    
      def parse!(body)
         self.auth = body.match(/Auth=(.*)/)[1]
      end
    end
  end
end