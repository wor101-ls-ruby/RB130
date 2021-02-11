require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test
  
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]
    
    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end
  
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  
  def test_size
    assert_equal(3, @todos.size)
  end
  
  def test_first
    assert_equal(@todo1, @todos.first)
    assert_same(@todo1, @todos.first)
  end
  
  def test_last
    assert_same(@todo3, @todos.last)
  end
  
  def test_shift
    todo = @list.shift
    assert_same(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    todo = @list.pop
    assert_same(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done?
    assert_equal(false, @list.done?)
  end
  
  def test_type_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add("Hello") }
  end
  
  def test_shovel
    new_todo = Todo.new("Party!")
    @list << new_todo
    assert_includes(@list.to_a, new_todo)
  end
  
  def test_add
    new_todo = Todo.new("Game night")
    @todos << new_todo
    @list.add(new_todo)
    assert_equal(@todos, @list.to_a)
  end
  
  def test_item_at
    assert_raises(IndexError) { @list.item_at(4) }
    assert_equal(@list.item_at(1), @todo2)
  end
  
  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(4) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
  
  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(50) }
    @list.mark_all_done
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end
  
  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end
  
  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(50) }
    removed_todo = @list.remove_at(1)
    assert_equal(@todo2, removed_todo)
    assert_equal([@todo1, @todo3], @list.to_a)
  end
  
  def test_to_s
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_done
    @list.mark_done_at(1)
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_done!
    @list.done!
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end
  
  def test_each
    test_array = []
    @list.each { |item| test_array << item }
    assert_equal(test_array, @todos)
  end
  
  def test_each_return
    assert_equal(@list, @list.each {|todo| nil})
  end
  
  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)
  
    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  end
  
end