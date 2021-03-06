require 'set'

class GraphNode

  # @return [Array<GraphNode>]
  attr_accessor :neighbors

  # @return [Object]
  attr_reader :value

  def initialize(value)
    @value = value
    @neighbors = []
  end

  def to_s
    "<#{value}>"
  end

  def inspect
    "<#{value}>"
  end

end

# @param [GraphNode] starting_node
# @param [Object] target_value
# @return [GraphNode, nil]
def bfs(starting_node, target_value)
  visited = Set[starting_node]
  frontier = [starting_node]
  until frontier.empty?

    # @type [GraphNode]
    current_node = frontier.shift
    return current_node if current_node.value == target_value

    current_node.neighbors.each do |node|
      frontier << node unless visited.include?(node)
      visited << node
    end
  end
  nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')

a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "f")