require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should_not allow_value("test@test").for(:name) 
end
