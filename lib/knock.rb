require 'uri'
require 'net/https'
require 'net/http'
require 'hash'

  
class Knock

   GOOGLE = "https://www.google.com:443/accounts/ClientLogin"
   APP_NAME = "Knock-Knock Ruby Gem"
   
   def self.connect user,password,serv
      @confs = { 'accountType' => 'GOOGLE',
                'Email' => user,
                'Passwd' => password,
                'service' => serv,
                'source' => APP_NAME }
              
      @@token ||= login
   end
 
   def self.login
     url = URI.parse(GOOGLE)
     req = Net::HTTP::Post.new(url.path)
     req.set_form_data(@confs)
     res = Net::HTTP.new(url.host, url.port)
     res.use_ssl = true
     body = res.start {|http| http.request(req) }
     body.body.split("\n").last.gsub("Auth=",'')      
   end
 
   ## ClientLogin Authentication requires the Auth property not the SID or LSID ones.
   ## Along with the Content-Lenght(that must exists!) goes the Auth on the header of every request the library does
   ## to Google.
   def self.header
     {'Cookie' => "Name=#{token};Auth=#{token};Domain=.google.com;Path=/;Expires=160000000000",
      'Content-length' => '0',
      'Authorization' => "GoogleLogin auth=#{token}"}
   end
 
   def self.token
     @@token
   end
 
   def self.get url,params
     uri = URI.parse(url + params.to_get)
     res = Net::HTTP::Get.new(uri.request_uri,header)
     http   = Net::HTTP.new(uri.host, uri.port)     
     http.use_ssl = true
     result = http.start() { |conn| conn.request(res) }
     result.body     
   end
      


end

# Knock.connect "bagabers@gmail.com","filhodaputa456","analytics"
# 
# p Knock.get "https://www.google.com/analytics/feeds/data?ids=ga:9804823",{:sort=>"ga:browser,ga:pageviews",:end_date=>"2008-08-10",:start_date=>"2008-07-10",:dimensions=>"ga:browser",:metrics=>"ga:pageviews"}



