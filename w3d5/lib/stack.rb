class Stack
  def initialize
    @data = []
  end

  def push(el)
    @data << el
    el
  end

  def pop
    @data.pop
  end

  def peek
    @data.last
  end
end

a = Stack.new
p a.push(1)
p a.push(2)
p a.push(3)
p a.pop
p a.pop
p a.push(4)
p a.peek
p a.pop
p a.pop
p a.pop
p a.peek