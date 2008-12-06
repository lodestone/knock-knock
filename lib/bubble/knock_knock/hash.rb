module Bubble
  module KnockKnock
    module Hash
            
      def to_uri
        self.map { |k,v| "#{k}=#{v}"}.join('&')
      end
      
    end
  end
end

class Hash
  include Bubble::KnockKnock::Hash
end