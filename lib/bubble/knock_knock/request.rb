module Bubble
  module KnockKnock
    class Request
      attr_accessor :header
      
      def initialize
        raise UnstablishedConnection if Connection.instance.auth.nil?
        
        connection = Connection.instance
        @header = {'Cookie' => "Name=#{connection.auth};Auth=#{connection.auth};Domain=.google.com;Path=/;Expires=160000000000",
                   'Content-length' => '0',
                   'Authorization' => "GoogleLogin auth=#{connection.auth}" }
      end
    
      def self.get(uri, query=nil)
        @request = self.new
        
        uri = URI.parse(uri)
                        
        http = Net::HTTP.new(uri.host, 443)
        http.use_ssl = true
              
        response, body = http.get("#{uri.path}?#{query}", @request.header)
        
        body
      end
    end
  end
end