require File.dirname(__FILE__) + '/test_helper.rb'

class Bubble::KnockKnock::TestHash < Test::Unit::TestCase
  def setup
    @data = { :group=>'hour', 
              :order=>'days_since_last_visit,bounce_rate' }
  end
    
  def test_to_uri
    assert_equal('group=hour&order=days_since_last_visit,bounce_rate', @data.to_uri)
  end
end