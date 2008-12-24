require File.dirname(__FILE__) + '/test_helper.rb'

class Bubble::KnockKnock::TestRequest < Test::Unit::TestCase # :nodoc: #
  include Bubble::KnockKnock
  include Bubble::KnockKnock::Exceptions
  
  def setup
    @atom = File.open(File.dirname(__FILE__) + "/fixtures/atom_feed.atom").readlines.join
    authenticate
  end
  
  def test_retrieving_data
    assert content = Request.get("http://www.google.com/m8/feeds/contacts/bubble.testing%40gmail.com/full")
    assert_match(/^<\?xml.*$/, content)
  end
  
  def test_deleting_contact
    create_contact
    
    assert content = Request.delete(@contact.delete_uri)
    assert_match(/^<\?xml.*$/, content)
  end
  
  def test_updating_contact
    create_contact
    @contact.change_title
    
    content = Request.put(@contact.edit_uri,@contact.content)
    assert_match(/^<\?xml.*$/, content)
    
    # Everytime you update something at Google, your edit url changes, which means 
    # you have to instanciate a new contact in order to work
    @contact = Contact.new(content)
    assert content = Request.delete(@contact.delete_uri)
    assert_match(/^<\?xml.*$/, content)
  end
    
  def test_bad_request
    bad_atom = @atom << "this_should_get a bad request" 
    
    assert_raise(BadRequest) do
      Request.post("http://www.google.com/m8/feeds/contacts/bubble.testing%40gmail.com/full", bad_atom)    
    end
  end
  
  private
  def authenticate
    Connection.connect('bubble.testing@gmail.com', 'bubblerocks', 'cp')
  end
  
  def create_contact
    @content = Request.post("http://www.google.com/m8/feeds/contacts/bubble.testing%40gmail.com/full", @atom)
    @contact = Contact.new(@content)
  end
end