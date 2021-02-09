array = [1, 2, 3, 4, 5]

def select(array)
  return_array = []
  
  array.each do |elem|
    return_array << elem if yield(elem)
  end
  
  return_array
end

p select(array) { |num| num.odd? }  # => [1, 3, 5]
p select(array) { |num| puts num }  # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }   # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true