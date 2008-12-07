module Bubble
  module KnockKnock

    # For login errors
    class BadLogin < Exception; end
    # For requests to Google services without a connection
    class UnstablishedConnection < Exception; end
    # Bad request at Google returns 400
    class BadRequest < Exception; end
    # When a 409 (HTTP Conflict) occurs. It happens when, for example, you try to create a contact but it exists.
    class HTTPConflict < Exception; end
    
  end
end