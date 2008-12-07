# A collection of util methods for KnockKnock gem
module Bubble::KnockKnock::Hash
  
  # Transforms the hash into to a string which will be used to transmit data with the requests.
  def to_uri
    self.map { |k,v| "#{k}=#{v}"}.join('&')
  end
  
end

class Hash
  include Bubble::KnockKnock::Hash
end