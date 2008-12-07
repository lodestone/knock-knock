require File.dirname(__FILE__) + '/test_helper.rb'

class TestKnockKnock < Test::Unit::TestCase # :nodoc:
  def setup
    @kk = Bubble::KnockKnock::Connection.instance
  end
  
  def test_stablish_connection
    assert_raise(Bubble::KnockKnock::BadLogin) { @kk.connect('test@gmail.com', 'password', 'xapi') }
    
    @kk.connect('bubble.testing@gmail.com', 'bubblerocks', 'cp')
    assert @kk.auth
  end
end