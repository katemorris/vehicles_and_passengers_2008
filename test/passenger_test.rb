require 'minitest/autorun'
require 'minitest/pride'
require './lib/passenger'

class PassengerTest < Minitest::Test

  def setup
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  def test_it_exists
    assert_instance_of Passenger, @charlie
    assert_instance_of Passenger, @taylor
  end

  def test_it_has_attributes
    assert_equal "Charlie", @charlie.name
    assert_equal 18, @charlie.age
  end

  def test_adult_status
    assert @charlie.adult?
    assert_equal false, @taylor.adult?
  end

  def test_driver_status
    assert_equal false, @charlie.driver?
    @charlie.drive
    assert @charlie.driver?
  end

end
