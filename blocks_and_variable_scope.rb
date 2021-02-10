def call_me(some_code)
  some_code.call        # call will excecute the "chuck of code" that gets passed in
end


name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"

call_me(chunk_of_code)