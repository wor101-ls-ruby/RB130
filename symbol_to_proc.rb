[1, 2, 3, 4, 5].map do |num|
  num.to_s
end

# the above can be done shorthand by using the & symbol to turn the appended Proc into a block. 
# If the appended object is not a block, it will call the #to_proc method on it. The Symbol class has a #to_proc method

p [1, 2, 3, 4, 5].map(&:to_s)

p ["hello", "world"].each(&:upcase!)              # => ["HELLO", "WORLD"]
p [1, 2, 3, 4, 5].select(&:odd?)                  # => [1, 3, 5]
p [1, 2, 3, 4, 5].select(&:odd?).any?(&:even?)    # => false

def my_method
  yield(2)
end

# turns symbol into Proc, then & turns the Proc into a block
p my_method(&:to_s)     # => "2"

def my_method
  yield(2)
end

a_proc = :to_s.to_proc          # explicitly call to_proc on the symbol
p my_method(&a_proc)              # convert Proc into block, then pass block in. Returns "2"