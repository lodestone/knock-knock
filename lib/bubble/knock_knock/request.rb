module Bubble
  module KnockKnock
    # This class gives you an easy way to request informations from Google.
    class Request
      include Bubble::KnockKnock
      include Bubble::KnockKnock::Exceptions
      
      attr_reader :header
  
      # Finds the Singleton Connection and creates the header structure to requesting informations.
      def initialize
        raise UnstablishedConnection if Connection.auth.nil?
      
        @header = {'Cookie' => "Name=#{Connection.auth};Auth=#{Connection.auth};Domain=.google.com;Path=/;Expires=160000000000",
                   'Content-length' => '0',
                   'Authorization' => "GoogleLogin auth=#{Connection.auth}" }
      end

      # Get the data from any Google Service.
      # You just need to indicate the URI of the API and the attributes must that be sent with the request.
      # The response's content will be returned if all occur as well.
      # === Example
      # You must to be connected. Take a look in Connection for more information.
      #
      #   Request.get('http://www.google.com/m8/feeds/contacts/email%40gmail.com/full')
      def self.get(uri, params=nil)
        response, body = action(:get, uri, params)    
        body
      end
      
      # Post data to any Google Service.
      # You just need to indicate the URI of the API and the attributes must that be sent in the request's body.
      # A Status code 201 CREATED will be return in case everything goes as planned!
      # === Example
      # You must to be connected. Take a look at Connection for more information.
      #
      #   Request.post('http://www.google.com/m8/feeds/contacts/email%40gmail.com/full', body)      
      def self.post(uri, params=nil)
        @response, @body = action(:post, uri, params)        
        handling
      end
      
      # Delete data at any Google Service.
      # You just need to indicate the URI of the API and also get the entity's ID you're trying to delete.
      # For more information on how to get the entity's ID,go to google code and check it out.
      # === Example
      # You must to be connected. Take a look at Connection for more information.
      #
      #   Request.delete('http://www.google.com/m8/feeds/contacts/email%40gmail.com/full/6f669dbb0f3d75ce/1228698987605000')
      def self.delete(uri,params=nil)
        @response, body = action(:delete, uri, params)        
        handling
      end
      
      # Update data at any Google Service.
      # You just need to indicate the URI of the API and also get the entity's ID you're trying to delete.
      # For more information on how to get the entity's ID,go to google code and check it out.
      # === Example
      # You must to be connected. Take a look at Connection for more information.
      #
      #   Request.put('http://www.google.com/m8/feeds/contacts/email%40gmail.com/full/6f669dbb0f3d75ce/1228698987605000')      
      def self.put(uri,params=nil)
        @response, @body = action(:put, uri, params)        
        handling
      end
      
      protected 
      
      # Generates the basic setup for both GET and POST requests(later on PUT and DELETE also). Any request at Google's services
      # must have SSL activated.
      # POST requests at Google always use atom+xml as their content type default.
      def self.setup(http_method, uri)
        
        @request = self.new
        @uri = URI.parse(uri)
        
        case http_method
        when :post
          @request.header.merge!('Content-Type' => 'application/atom+xml')
        when :get
          @request.header.merge!('Content-Type' => 'application/xml')
        when :delete
          @request.header.merge!('Content-Type' => 'application/atom+xml')
        when :put
          @request.header.merge!('X-HTTP-Method-Override' =>'PUT', 'Content-Type' => 'application/atom+xml')
        end
        
        @http = Net::HTTP.new(@uri.host, 443)
        @http.use_ssl = true
      end
      
      # Responsible by makes the right request when the developer points the HTTP Method (Post, Get), adding the parameters and the right header.
      def self.action(http_method, uri, params)
        setup(http_method, uri)
        
        case http_method
        when :post
          @http.post(@uri.path, params, @request.header)
        when :get
          @http.get("#{@uri.path}?#{params}", @request.header)
        when :delete
          @http.delete(@uri.path, @request.header)
        when :put
          @http.post(@uri.path, params, @request.header)
        end
      end
      
      # Returns the request's response, might be a error or XML
      def self.handling
        
        case @response.code.to_i
          when 400; raise BadRequest
          when 409; raise HTTPConflict
          else; @body
        end
        
      end
      
    end
  end
end