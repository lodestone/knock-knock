require File.dirname(__FILE__) + '/test_helper.rb'

ATOM_FEED = File.dirname(__FILE__) + "/../fixtures/atom_feed.atom"

class TestKnockKnock < Test::Unit::TestCase # :nodoc:
  def setup
    @kk = Bubble::KnockKnock::Connection.instance
  end
  
  def test_stablish_connection
    assert_raise(Bubble::KnockKnock::BadLogin) { @kk.connect('test@gmail.com', 'password', 'xapi') }
    
    authenticate
    assert @kk.auth
  end
  
  def test_retrieving_data
    authenticate
    
    assert body = Bubble::KnockKnock::Request.get("http://www.google.com/m8/feeds/contacts/bubble.testing%40gmail.com/full")
    assert_match(/^<\?xml.*/, body)
    assert_equal(@kk.auth, Bubble::KnockKnock::Connection.instance.auth)
  end
  
  def test_retrieving_post_feed
    authenticate
    new_group = File.open(ATOM_FEED).readlines.join
                
    body = Bubble::KnockKnock::Request.post("http://www.google.com/m8/feeds/contacts/bubble.testing%40gmail.com/full",new_group)
    assert_match(/^<\?xml.*/, body)
  end
  
  private
  def authenticate
    @kk.connect('bubble.testing@gmail.com', 'bubblerocks', 'cp')
  end
end
