# def hello
#   "hello!"
# end 

# p hello

# p hello { puts 'hi' }

# def echo(str)
#   str
# end 

# p echo("Hello!") { puts "World" }

# def echo_with_yield(str)
#   yield if block_given?
#   str
# end 

# #cho_with_yield { puts "world" }                        # => ArgumentError: wrong number of arguments (0 for 1)
# # p echo_with_yield("hello!") { puts "world" }              # world
#                                                         # => "hello!"
# #echo_with_yield("hello", "world!") { puts "world" }     # => ArgumentError: wrong number of arguments (2 for 1)

# p echo_with_yield("hello!")
# p echo_with_yield("hello!") { puts "world" }

# method implementation
# def say(words)
#   yield if block_given?
#   puts "> " + words
# end

# # method invocation
# say("hi there") do 
#   system 'clear'
# end

#method implementation
def increment(number)
  if block_given?
    yield(number + 1)
  end
  
  number + 1
end 


# method invocation
# increment(5) do |num|
#   puts num
# end

# def test
#   yield(1)
# end

# test do |num1, num2| 
#   puts "#{num1} #{num2}"
# end

# def compare(str)
#   puts "Before: #{str}"
#   after = yield(str)
#   puts "After: #{after}"
# end

# compare('hello') { |word| puts "hi" }

# def time_it
#   time_before = Time.new
#   yield # execute implicit block
#   time_after = Time.now
  
#   puts "It took #{time_after - time_before} seconds."
# end

# time_it { sleep(3) } 

# time_it { "hello world" }

# my_file = File.open("some_file.txt", "w+")
# my_file.close

def test2(block)
  puts "hello"
  block.call
  puts "good-bye"
end

def test(&block)
  puts "1"
  test2(block)
  puts 2
end

test { puts "xyz" }