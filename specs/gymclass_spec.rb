require 'minitest/autorun'
require_relative '../models/gymclass'

class TestGymClass < Minitest::Test

  def setup
    options = {
      "name" => "Cycle",
      "capacity" => 25,
      "timetable" => "17:00"
    }
    @class = GymClass.new(options)
  end

  def test_name()
    result = @class.name()
    assert_equal("Cycle", result)
  end

  def test_capacity()
    result = @class.capacity()
    assert_equal(25, result)
  end

  def test_timetable()
    result = @class.timetable()
    assert_equal("17:00", result)
  end

end
