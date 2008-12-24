require File.dirname(__FILE__) + '/test_helper.rb'

class TestKnockKnock < Test::Unit::TestCase # :nodoc:
  include Bubble::KnockKnock
  include Bubble::KnockKnock::Exceptions
  
  def test_stablish_connection
    assert_raise(BadLogin) { Connection.connect('test@gmail.com', 'password', 'xapi') }
    
    Connection.connect('bubble.testing@gmail.com', 'bubblerocks', Services::GoogleContacts)
    assert google = Connection.auth
    Connection.connect('bubble.testing@gmail.com', 'bubblerocks', Services::GoogleCalendar)
    assert google = Connection.auth
    Connection.connect('bubble.testing@gmail.com', 'bubblerocks', Services::GoogleApps)
    assert google = Connection.auth
    Connection.connect('bubble.testing@gmail.com', 'bubblerocks', Services::GoogleFinance)
    assert google = Connection.auth
    Connection.connect('bubble.testing@gmail.com', 'bubblerocks', Services::GoogleSpreadsheets)
    assert google = Connection.auth
    Connection.connect('bubble.testing@gmail.com', 'bubblerocks', Services::GoogleDocuments)
    assert google = Connection.auth
    Connection.connect('bubble.testing@gmail.com', 'bubblerocks', Services::Blogger)
    assert google = Connection.auth
    Connection.connect('bubble.testing@gmail.com', 'bubblerocks', Services::Youtube)
    assert google = Connection.auth
    Connection.connect('bubble.testing@gmail.com', 'bubblerocks', Services::Picasa)
    assert google = Connection.auth
    
    # Test with a hosted Google Account
    Connection.connect('test@bubble.com.br', 'B48938', Services::GoogleApps)
    assert Connection.auth
    assert Connection.auth != google
  end
end