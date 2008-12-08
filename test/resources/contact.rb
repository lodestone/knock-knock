require 'rubygems'
require 'xml-object'

class Contact
  
  attr_accessor :edit_uri,:content
  alias_method :delete_uri,:edit_uri

  def initialize(xml)
    self.content = xml
    @attributes = XMLObject.new(xml)
    find_edit_uri
  end
  
  def find_edit_uri
    self.edit_uri = @attributes.links.select { |x| x.rel == "edit" }.first.href
  end
  
  def change_title
    self.content.gsub!('Elizabeth Bennet','Alexandre Gregianin')
  end
    
end
