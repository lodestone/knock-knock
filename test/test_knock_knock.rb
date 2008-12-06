require File.dirname(__FILE__) + '/test_helper.rb'

class TestKnockKnock < Test::Unit::TestCase  
  include Bubble::KnockKnock
  
  def setup
    @kk = Connection.instance
  end
  
  def test_stablish_connection
    assert_raise(BadLogin) { @kk.connect('test@gmail.com', 'password', 'xapi') }
    
    authenticate
    assert @kk.auth
  end
  
  def test_retrieving_data
    authenticate
    
    assert body = Request.get("http://www.google.com/m8/feeds/contacts/bubble.testing%40gmail.com/full")
    assert_match(/^<\?xml.*/, body)
    assert_equal(@kk.auth, Connection.instance.auth)
  end
  
  private
  def authenticate
    @kk.connect('bubble.testing@gmail.com', 'bubblerocks', 'cp')
  end
end
