require 'minitest/autorun'
require_relative '../models/booking'

class TestBookinf < Minitest:: Test

  def setup
    options = {
      "member_id" => 20,
      "gym_class_id" => 30
    }
    @booking = Booking.new(options)
  end

  def test_member_id()
    result = @booking.member_id()
    assert_equal(20, result)
  end

  def test_gym_class_id()
    result = @booking.gym_class_id()
    assert_equal(30, result)
  end
end
