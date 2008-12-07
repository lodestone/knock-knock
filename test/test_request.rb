require File.dirname(__FILE__) + '/test_helper.rb'

class Bubble::KnockKnock::TestRequest < Test::Unit::TestCase # :nodoc: #
  include Bubble::KnockKnock
  
  def setup
    @atom = File.open(File.dirname(__FILE__) + "/fixtures/atom_feed.atom").readlines.join
    authenticate
  end
  
  def test_retrieving_data
    assert content = Request.get("http://www.google.com/m8/feeds/contacts/bubble.testing%40gmail.com/full")
    assert_match(/^<\?xml.*/, content)
  end
  
  def test_retrieving_post_feed
    # Cause the contact is all right created, it can't be created again. Then a 409 occurs (HTTP Conflict).
    # We need to implement the DELETE HTTP Method to delete this contact.
    
    assert_raise(HTTPConflict) do
      Request.post("http://www.google.com/m8/feeds/contacts/bubble.testing%40gmail.com/full", @atom)
    end
  end
  
  def test_bad_request
    bad_atom = @atom << "this_should_get a bad request" 
    
    assert_raise(BadRequest) do
      Request.post("http://www.google.com/m8/feeds/contacts/bubble.testing%40gmail.com/full", bad_atom)    
    end
  end
  
  private
  def authenticate
    Connection.instance.connect('bubble.testing@gmail.com', 'bubblerocks', 'cp')
  end
end