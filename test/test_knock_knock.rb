require File.dirname(__FILE__) + '/test_helper.rb'

class TestKnockKnock < Test::Unit::TestCase # :nodoc:
  include Bubble::KnockKnock
  include Bubble::KnockKnock::Exceptions
  
  def setup
    @kk = Connection.instance
  end
  
  def test_stablish_connection
    assert_raise(BadLogin) { @kk.connect('test@gmail.com', 'password', 'xapi') }
    
    @kk.connect('bubble.testing@gmail.com', 'bubblerocks', 'cp')
    assert google = @kk.auth
    
    # Test with a hosted Google Account
    @kk.connect('test@bubble.com.br', 'B48938', 'cp')
    assert @kk.auth
    assert @kk.auth != google
  end
end