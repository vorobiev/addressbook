require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
end
