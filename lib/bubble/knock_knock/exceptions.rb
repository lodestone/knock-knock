module Bubble
  module KnockKnock

    # For login errors
    class BadLogin < Exception; end
    # For requests to Google services without a connection
    class UnstablishedConnection < Exception; end
    
  end
end