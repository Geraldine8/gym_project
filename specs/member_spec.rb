require 'minitest/autorun'
require_relative '../models/member'

class TestMember < Minitest::Test

  def setup
    options = {
      "id" => 1,
      "first_name" => "Anna",
      "last_name" => "Barbone",
      "contact_number" => "07478635245",
      "email" => "a.barbone@gmail.com",
      "premium" => 1
    }
    @member = Member.new(options)
  end

  def test_first_name()
    result = @member.first_name()
    assert_equal("Anna", result)
  end

  def test_last_name()
    result = @member.last_name()
    assert_equal("Barbone", result)
  end

  def test_contact_number()
    result = @member.contact_number()
    assert_equal("07478635245", result)
  end

  def test_email()
    result = @member.email()
    assert_equal("a.barbone@gmail.com", result)
  end

  def test_premium()
    result = @member.premium()
    assert_equal(1, result)
  end

end
