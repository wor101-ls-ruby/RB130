require 'pry'
array = [1, 2, 3, 4, 5]

def reduce(array, default = 0)
  %w(Integer Float).include?(array[0].class.to_s) ? accumulator = default : accumulator = ''
  array.each do |elem|
    accumulator = yield(accumulator, elem)
  end
  accumulator
end

p reduce(array) { |acc, num| acc + num }              # => 15
p reduce(array, 10) { |acc, num| acc + num }          # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }  # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }