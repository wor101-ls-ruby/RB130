# method implementation
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end
  number        # return the original method argument to match behaviour of 'Integer#times' method
end



# 5.times do |num|
#   puts num
# end

# method invocation
a = times(5) do |num|
  puts num
end

puts a