class AQueue
  def initialize
    @data = []
  end

  def enqueue(el)
    @data << el
    el
  end

  def dequeue
    @data.shift
  end

  def peek
    @data.first
  end
end

a = AQueue.new
p a.enqueue 1
p a.enqueue 2
p a.enqueue 3
p a.dequeue
p a.dequeue
p a.enqueue 4
p a.peek
p a.dequeue
p a.dequeue
p a.dequeue
p a.peek