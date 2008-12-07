# This class gives you a easy way to request informations from Google.
class Bubble::KnockKnock::Request
  attr_reader :header
  
  # Finds the Singleton Connection and creates the header structure to requesting informations.
  def initialize
    raise UnstablishedConnection if Connection.instance.auth.nil?
    
    connection = Connection.instance
    @header = {'Cookie' => "Name=#{connection.auth};Auth=#{connection.auth};Domain=.google.com;Path=/;Expires=160000000000",
               'Content-length' => '0',
               'Authorization' => "GoogleLogin auth=#{connection.auth}" }
  end

  # Get the data from any Google Service.
  # You just need to indicate the URI of the API and the attributes must be sent with the request.
  # The content of the response will be returned if all occour as well.
  # === Example
  # You must to be connected. Take a look in Connection for more information.
  #
  #   Request.get('http://www.google.com/m8/feeds/contacts/email%40gmail.com/full')
  def self.get(uri, query=nil)
    @request = self.new
    
    uri = URI.parse(uri)
                    
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true
          
    response, body = http.get("#{uri.path}?#{query}", @request.header)
    
    body
  end
end