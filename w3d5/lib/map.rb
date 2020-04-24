class Map
  def initialize
    @data = []
  end

  def get(key)
    entry = @data.find { |k, _| k == key }
    entry ? entry[1] : nil
  end

  def set(key, value)
    entry = @data.find { |k, _| k == key }
    if entry
      entry[1] = value
    else
      @data << [key, value]
    end
    value
  end

  def delete(key)
    index = @data.index { |k, _| k == key }
    if index
      entry = @data[index]
      @data.delete_at(index)
      entry
    else
      nil
    end
  end

end


a = Map.new
p a.set(1, "one")
p a.set(2, "two")
p a.set(3, "three")
p a.delete(2)
p a.get(3)
p a.get(2)
p a.delete(99)