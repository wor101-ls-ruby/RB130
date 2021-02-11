require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def setup
    @car = Car.new
  end
  
  # assert(test) test fails unless test is truthy
  def test_car_exists
    assert(@car)
  end
  
  # assert_equal(exp, act) fails unless exp == act
  def test_wheels
    assert_equal(4, @car.wheels)
  end
  
  # assert_nil(obj) fails unless obj is nil
  def test_name_is_nil
    assert_nil(@car.name)
  end
  
  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new(name: "Joey")
    end
  end
  
  # assert_instance_of(cls, obj) fails unless obj is an instance of cls
  def test_instance_of_car
    assert_instance_of(Car, @car)
  end
  
  # assert_includes(collection, obj)
  def test_includes_car
    arr = [1, 2, 3]
    arr << @car
    
    assert_includes(arr, @car)
  end
end