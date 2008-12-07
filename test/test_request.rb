require File.dirname(__FILE__) + '/test_helper.rb'

class Bubble::KnockKnock::TestRequest < Test::Unit::TestCase # :nodoc: #
  def setup
    @atom = File.open(File.dirname(__FILE__) + "/fixtures/atom_feed.atom").readlines.join
  end
  
  def test_retrieving_data
    authenticate
    
    assert content = Bubble::KnockKnock::Request.get("http://www.google.com/m8/feeds/contacts/bubble.testing%40gmail.com/full")
    assert_match(/^<\?xml.*/, content)
  end
  
  def test_retrieving_post_feed
    authenticate
                
    content = Bubble::KnockKnock::Request.post("http://www.google.com/m8/feeds/contacts/bubble.testing%40gmail.com/full", @atom)
    assert_match(/^<\?xml.*/, content)
  end
  
  def test_bad_request
    authenticate    
    bad_atom = @atom << "this_should_get a bad request" 
    
    assert_raise(Bubble::KnockKnock::BadRequest) do
      Bubble::KnockKnock::Request.post("http://www.google.com/m8/feeds/contacts/bubble.testing%40gmail.com/full", bad_atom)    
    end
  end
  
  private
  def authenticate
    Bubble::KnockKnock::Connection.instance.connect('bubble.testing@gmail.com', 'bubblerocks', 'cp')
  end
end