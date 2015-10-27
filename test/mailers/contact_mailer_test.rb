require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "share" do
 
    email = ContactMailer.share(contacts(:first), 'friend@example.com').deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ['friend@example.com'], email.to
 
  end
end
