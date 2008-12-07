module Bubble
  module KnockKnock

    # For login errors
    class BadLogin < Exception; end
    # For requests to Google services without a connection
    class UnstablishedConnection < Exception; end
    # Bad request at Google returns 400
    class BadRequest < Exception; end
      
    
  end
end