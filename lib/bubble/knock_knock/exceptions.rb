# For login errors
class Bubble::KnockKnock::BadLogin < Exception; end
# For requests to Google services without a connection
class Bubble::KnockKnock::UnstablishedConnection < Exception; end