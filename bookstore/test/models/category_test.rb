require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup 
    @category = Category.new 
  end

  test "name should be present" do 
    @category.name = ""
    assert !@category.valid?
  end

  test "name should be at least 3 characters" do 
    @category.name = "a"*2
    assert !@category.valid?
  end
end
