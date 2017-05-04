require 'test_helper'

class PublisherTest < ActiveSupport::TestCase
  def setup
    @publisher = Publisher.new 
  end

  test "name should be presented" do 
    @publisher.name = ""
    assert !@publisher.valid?
  end
end
