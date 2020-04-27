class Board

  # @return [Array<Array<Symbol>>]
  attr_accessor :cups

  # @param [String] name1
  # @param [String] name2
  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    place_stones
  end

  def place_stones
    @cups = Array.new(14) { Array.new(4) { :stone } }
    cups[6] = []
    cups[13] = []
  end

  # @param [Integer] start_pos
  def valid_move?(start_pos)
    raise "Invalid starting cup" unless (0...6).include?(start_pos) || (7...14).include?(start_pos)
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  # @param [Integer] start_pos
  # @param [String] current_player_name
  # @return [Symbol, Integer]
  def make_move(start_pos, current_player_name)
    skip = @player1 == current_player_name ? 13 : 6
    stones = cups[start_pos]
    index = start_pos
    until stones.empty?
      index += 1
      index %= 14
      next if index == skip

      cups[index] << stones.pop
    end
    render
    next_turn(index)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if cups[ending_cup_idx].length == 1

    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0...6].all?(&:empty?) || cups[7...13].all?(&:empty?)
  end

  
  # @return [String, Symbol]
  def winner
    return :draw if cups[6].length == cups[13].length

    cups[6].length > cups[13].length ? @player1 : @player2
  end
end
