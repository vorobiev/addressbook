require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)

  should validate_uniqueness_of(:first_name).scoped_to(:last_name)
  
  should have_many(:emails)
  should have_many(:phones)

  test 'at least one phone and one email' do
    contact = Contact.create(first_name: 'John', last_name: 'Smith', phones: [], emails: [])
    assert_not contact.valid?
  end

end
