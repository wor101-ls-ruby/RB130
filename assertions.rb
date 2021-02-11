require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  # assert(test) test fails unless test is truthy
  def test_car_exists
    car = Car.new
    assert(car)
  end
  
  # assert_equal(exp, act) fails unless exp == act
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
  
  # assert_nil(obj) fails unless obj is nil
  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end
  
  # assert_instance_of(cls, obj) fails unless obj is an instance of cls
  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end
  
  # assert_includes(collection, obj)
  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car
    
    assert_includes(arr, car)
  end
  
end