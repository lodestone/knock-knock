module Bubble
  module KnockKnock
    # A collection of util methods for KnockKnock gem
    module Bubble::KnockKnock::Hash
  
      # Transforms the hash into a string which will be used to transmit data with the requests.
      def to_uri
        self.sort_by { |k,v| k.to_s }.map { |k,v| "#{k}=#{v}"}.join('&')
      end
  
    end
  end
end

class Hash
  include Bubble::KnockKnock::Hash
end