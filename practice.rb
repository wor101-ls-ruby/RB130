def select(array)
  counter = 0
  new_array = []
  
  while counter < array.size
    new_array << array[counter] if yield(array[counter])
    counter += 1
  end
  new_array
end


a = (1..10).to_a

p select(a) { |x| x.even? }
