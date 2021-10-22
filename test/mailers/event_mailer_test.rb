require "test_helper"

class EventMailerTest < ActionMailer::TestCase
  test "event_inscription" do
    mail = EventMailer.event_inscription
    assert_equal "Event inscription", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
