# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '
  
  attr_accessor :title, :description, :done
  
  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end
  
  def done!
    self.done = true
  end
  
  def done?
    done
  end
  
  def undone!
    self.done = false
  end
  
  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
  
  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selectio

class TodoList
  attr_accessor :title
  
  def initialize(title)
    @title = title
    @todos = []
  end
  
  def <<(todo)
    raise TypeError, "Can only add Todo Objects" unless todo.instance_of? Todo
    @todos << todo
  end
  alias_method :add, :<<
  
  def size
    @todos.size
  end
  
  def first
    @todos.first
  end
  
  def last
    @todos.last
  end
  
  def to_a
    @todos
  end
  
  def done?
    @todos.all? { |item| item.done? == true }
  end
  
  def item_at(index)
    @todos.fetch(index) # fetch will raise the IndexError
  end
  
  def mark_done_at(index)
    item_at(index).done!
  end
  
  def mark_undone_at(index)
    item_at(index).undone!
  end
  
  def to_s
    return_string = "---- Today's Todos ----\n"
    @todos.each { |item| return_string += item.to_s + "\n" }
    return_string
  end
  
  def done!
    @todos = @todos.map do |item| 
      item.done!
      item
    end
  end
  
  def shift
    @todos.shift
  end
  
  def pop
    @todos.pop
  end
  
  def remove_at(index)
    @todos.delete(item_at(index))
  end
  
  def each
    counter = 0
    while counter < size
      yield(item_at(counter))
      counter += 1
    end
    self
  end
  
  def select
    return_list = TodoList.new(title)
    #return_array = []
    each do |item|
      return_list << item if yield(item)
    end
    return_list
  end
  
  def find_by_title(search_title)
    select { |item| item.title == search_title }.first
    # each { |item| return item if item.title == search_title }
    # nil
  end
  
  def all_done
    select { |item| item.done? }
  end
  
  def all_not_done
    select { |item| !item.done? }
  end
  
  def mark_done(search_title)
    find_by_title(search_title) && find_by_title(search_title).done!

    # each do |item|
    #   if find_by_title(search_title) == item
    #     item.done!
    #     break
    #   end
    # end
  end
  
  def mark_all_done
    each { |item| item.done! }
  end
  
  def mark_all_undone
    each { |item| item.undone! }
  end
  
end
    

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
p list.size                       # returns 3

# first
p list.first                      # returns todo1, which is the first item in the list

# last
p list.last                       # returns todo3, which is the last item in the list

#to_a
p list.to_a                      # returns an array of all items in the list

#done?
p list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
#list.item_at                    # raises ArgumentError
p list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
#list.mark_done_at               # raises ArgumentError
#list.mark_done_at(1)            # marks the 2nd item as done
#list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
#list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# done!
#list.done!                      # marks all items as done

# ---- Deleting from the list -----

# shift
# list.shift                      # removes and returns the first item in list

# pop
# list.pop                        # removes and returns the last item in list

# remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
puts list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym
# puts ""
# puts "#each method:"
# list.each do |todo|
#   puts todo
# end

todo1.done!

# results = list.select { |todo| todo.done? }
# puts results.inspect


list.find_by_title("Buy milk")
list.all_done
list.all_not_done
list.mark_done("Clean room")
list.mark_all_done
list.mark_all_undone
p list.all_done