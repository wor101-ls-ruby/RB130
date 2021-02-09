def each(array)
  counter = 0
  
  while counter < array.size
    yield(array[counter])     # yield to the block passing in the currnet counter as the index location
    counter += 1
  end
  
   array  # returns the array parameter similar to how the array#each method returns the caller
end

a = each([1, 2, 3, 4, 5]) do |num|
  puts num
end

puts "Return: #{a}"

b = each([1, 2, 3, 4, 5]) {|num| "do nothing"}.select{ |num| num.odd? }
puts "b Return: #{b}"