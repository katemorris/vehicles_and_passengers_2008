require 'minitest/autorun'
require 'minitest/pride'
require './lib/vehicle'
require './lib/passenger'

class VehicleTest < Minitest::Test

  def setup
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
  end

  def test_it_exists
    assert_instance_of Vehicle, @vehicle
  end

  def test_it_has_attributes
    assert_equal "2001", @vehicle.year
    assert_equal "Honda", @vehicle.make
    assert_equal "Civic", @vehicle.model
  end

  def test_acceleration
    assert_equal false, @vehicle.speeding?
    @vehicle.speed
    assert @vehicle.speeding?
  end

  def test_it_can_have_passengers
    @vehicle.passengers
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    @vehicle.add_passenger(charlie)
    @vehicle.add_passenger(jude)
    @vehicle.add_passenger(taylor)

    assert_equal [charlie, jude, taylor], @vehicle.passengers
  end

  def test_counting_adults_in_vehicle
    assert_equal 2, @vehicle.num_adults
  end
end
