require File.dirname(__FILE__) + '/test_helper.rb'

class TestKnockKnock < Test::Unit::TestCase # :nodoc:
  include Bubble::KnockKnock
  include Bubble::KnockKnock::Exceptions
  
  def test_stablish_connection
    assert_raise(BadLogin) { Connection.connect('test@gmail.com', 'password', 'xapi') }
    
    Connection.connect('bubble.testing@gmail.com', 'bubblerocks', Services::GoogleContacts)
    assert google = Connection.auth
    
    # Test with a hosted Google Account
    Connection.connect('test@bubble.com.br', 'B48938', Services::GoogleApps)
    assert Connection.auth
    assert Connection.auth != google
  end
end