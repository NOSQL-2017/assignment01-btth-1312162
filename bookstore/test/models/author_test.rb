require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  def setup 
    @author = Author.new 
  end

  test "name should be present" do 
    @author.first_name = ""
    @author.last_name = ""
    assert !@author.valid?
  end

  test "name should be at least 3 characters" do 
    @author.first_name = "a"*2
    @author.last_name = "a"*2
    assert !@author.valid?
  end
end
