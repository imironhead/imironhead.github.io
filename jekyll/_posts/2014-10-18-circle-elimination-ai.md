---
layout: post
title: "Circle Elimination Game with AI in Ruby"
description: ""
category:
tags: ["ruby", "programming", "ai"]
---

* Learning UCT, not finish yet.
* Reference: [mcts.ai](http://mcts.ai/code/python.html)

* -p, --power N                    power of AI
* -s, --size N                     play game on board of size N
* -e, --eliminate N                maximum stones can be eliminated one time
* -f, --first                      player first
* -l, --last                       player who eliminates the last stone lose the game
* -h, --help                       show this message

In each turn, the input may be:
* "row1, col1, row2, col2" (eg: 0,0,2,2) which would eliminate all stones between
(row1, col1) and (row2, col2) (both inclusive).
* "row, col" which eliminate only 1 stone.

~~~ ruby
# reference: http://mcts.ai/code/python.html

require 'optparse'


# stone position
class Position
  attr_accessor :row
  attr_accessor :col

  def initialize(pos_row, pos_col)
    @row = pos_row
    @col = pos_col
  end

  def right!(distance = 1)
    @col += distance
    self
  end

  def down!(distance = 1)
    @row += distance
    self
  end

  def diagonal!(distance = 1)
    @col += distance
    @row += distance
    self
  end

  def ==(that)
    that.col == col and that.row == row
  end

  def inspect
    "pos (#{row}, #{col})"
  end
end

# A move represents all positions between head and tail.
class Move
  attr_accessor :head
  attr_accessor :tail

  def initialize(pos1, pos2 = nil)
    if pos2.nil?
      pos2 = pos1
    elsif pos2.col < pos1.col or pos2.row < pos1.row
      pos1, pos2 = pos2, pos1
    end

    @head = Position.new(pos1.row, pos1.col)
    @tail = Position.new(pos2.row, pos2.col)
  end

  # return all positions between head and tail (head and tail are included)
  def positions
    if head.row == tail.row
      (head.col..tail.col).each.map { | c | Position.new(head.row, c) }
    elsif head.col == tail.col
      (head.row..tail.row).each.map { | r | Position.new(r, head.col) }
    else
      (head.row..tail.row).each_with_index.map do | r, i |
        Position.new(r, head.col + i)
      end
    end
  end

  def ==(that)
    that.head == head and that.tail == tail
  end
end

class Board
  LIVE_STONE_SIGN = "○"
  DEAD_STONE_SIGN = "●"

  LIVE_STONE = true
  DEAD_STONE = false

  attr_reader :max_elimination
  attr_reader :stones

  # board_size: height of the triangle with circles.
  # max_elimination: max number of connected circles can be eliminated in each turn.
  def initialize(board_size = 6, max_elimination = 3)
    @max_elimination = [1, max_elimination].max

    @stones = Array.new([2, board_size].max) do | line |
      Array.new(line + 1, LIVE_STONE)
    end
  end

  # the representation of a board with height 10:
  # --------------
  #   0 ○
  #   1 ○○
  #   2 ○○○
  #   3 ○○○○
  #   4 ○○○○○
  #   5 ○○○○○○
  #   6 ○○○○○○○
  #   7 ○○○○○○○○
  #   8 ○○○○○○○○○
  #   9 ○○○○○○○○○○
  #     0123456789
  # --------------
  def inspect
    gutter_size = size.to_s.length + 2

    spliter = "-" * (gutter_size + size)

    result = spliter.clone

    stones.each_with_index do | line, i |
      result << "\n#{ i.to_s.rjust gutter_size - 1 } "

      line.each do | s |
        result << (s == LIVE_STONE ? LIVE_STONE_SIGN : DEAD_STONE_SIGN)
      end
    end

    result << "\n"
    result << " " * gutter_size

    size.times { | i | result << (i % 10).to_s }

    result << "\n#{spliter}"
  end

  # clone the board and return it
  def copy
    board = Board.new(size, max_elimination)

    dead_stones.each { | pos | board.dead_stone!(pos) }

    board
  end

  def size
    stones.length
  end

  def stone(pos)
    stones[pos.row][pos.col]
  end

  def filtered_stones(filter)
    result = []

    stones.each_with_index do | line, row |
      line.each_with_index do | s, col |
        if filter.call(row, col, s)
          result << Position.new(row, col)
        end
      end
    end

    result
  end

  def valid_stone?(pos)
    pos.row < size and pos.col <= pos.row
  end

  def live_stone?(pos)
    valid_stone?(pos) and stone(pos) == LIVE_STONE
  end

  def dead_stone?(pos)
    valid_stone?(pos) and stone(pos) == DEAD_STONE
  end

  def dead_stone!(pos)
    @stones[pos.row][pos.col] = DEAD_STONE
  end

  # => return positions of all live stones
  def live_stones
    filtered_stones(lambda { | row, col, live | live == LIVE_STONE })
  end

  # => return positions of all dead stones
  def dead_stones
    filtered_stones(lambda { | row, col, live | live == DEAD_STONE })
  end

  # max length that all stones between (row, col) and (row, col + length - 1)
  # are alive.
  def max_row_length_from(pos)
    (0...max_elimination).each do | l |
      return l unless live_stone?(Position.new(pos.row, pos.col + l))
    end

    max_elimination
  end

  # max length that all stones between (row, col) and (row + length - 1, col)
  # are alive.
  def max_col_length_from(pos)
    (0...max_elimination).each do | l |
      return l unless live_stone?(Position.new(pos.row + l, pos.col))
    end

    max_elimination
  end

  # max length that all stones between (row, col) and
  # (row + length - 1, col + length - 1) are alive.
  def max_dia_length_from(pos)
    (0...max_elimination).each do | l |
      return l unless live_stone?(Position.new(pos.row + l, pos.col + l))
    end

    max_elimination
  end

  # eliminate stones between (row, col) and (row, col + l)
  # l is a random length less than max_row_length_from(row, col)
  def random_row_move_from(pos)
    length = rand(max_row_length_from(pos))

    Move.new(pos, Position.new(pos.row, pos.col + length))
  end

  # eliminate stones between (row, col) and (row + l, col)
  # l is a random length less than max_col_length_from(row, col)
  def random_col_move_from(pos)
    length = rand(max_col_length_from(pos))

    Move.new(pos, Position.new(pos.row + length, pos.col))
  end

  # eliminate stones between (row, col) and (row + l, col + l)
  # l is a random length less than max_dia_length_from(row, col)
  def random_dia_move_from(pos)
    length = rand(max_dia_length_from(pos))

    Move.new(pos, Position.new(pos.row + length, pos.col + length))
  end

  def random_live_stone
    live_stones.sample
  end

  def random_eliminate
    head = random_live_stone

    return nil if head.nil?

    move = case rand(3)
    when 0
      random_row_move_from(head)
    when 1
      random_col_move_from(head)
    else
      random_dia_move_from(head)
    end

    eliminate move

    move
  end

  def eliminate(move)
    move.positions.each do | pos |
      dead_stone! pos
    end
  end

  # all possible moves from current states
  def moves
    all = []

    live_stones.each do | head |
      len = max_row_length_from(head)

      (0...len).each do | l |
        all << Move.new(head, Position.new(head.row, head.col + l))
      end

      len = max_col_length_from(head)

      (0...len).each do | l |
        all << Move.new(head, Position.new(head.row + l, head.col))
      end

      len = max_dia_length_from(head)

      (0...len).each do | l |
        all << Move.new(head, Position.new(head.row + l, head.col + l))
      end
    end

    all
  end
end

class Node
  PLAYER_BOT = 0
  PLAYER_USR = 1

  attr_reader :move
  attr_reader :possible_moves
  attr_reader :children
  attr_reader :parent
  attr_reader :player

  attr_accessor :count_of_wins
  attr_accessor :count_of_visits

  def initialize(current_move, parent, current_player, board)
    @move = current_move
    @parent = parent
    @children = []
    @count_of_wins = 0
    @count_of_visits = 0
    @player = current_player
    @possible_moves = board.moves
  end

  def select
    @children.max do | a, b |
      x = 2 * Math.log(count_of_visits) / a.count_of_visits
      y = 2 * Math.log(count_of_visits) / b.count_of_visits

      x = a.count_of_wins / a.count_of_visits + Math.sqrt(x)
      y = b.count_of_wins / b.count_of_visits + Math.sqrt(y)

      x <=> y
    end
  end

  def add_child(move, board)
    @possible_moves.delete(move)

    @children << Node.new(move, self, match, board)

    @children[-1]
  end

  def update(winner)
    @count_of_visits += 1
    @count_of_wins += if winner == player then 1 else -1 end
  end

  def match
    1 - player
  end
end

class Game
  MODE_LAST_WIN = 0
  MODE_LAST_LOSE = 1

  STATE_NOT_ENDED = 0
  STATE_USR_WIN = 1
  STATE_BOT_WIN = 2

  def self.parse_args
    arguments = {}

    arguments[:size] = 6
    arguments[:max_elimination] = 3
    arguments[:last_win] = true
    arguments[:usr_first] = false
    arguments[:power] = 1

    option_parser = OptionParser.new do | options |
      options.banner = "Usage: circles.rb [options]"

      options.separator ""
      options.separator "Specific options:"

      options.on("-p N", "--power N", Integer, "power of AI") do | s |
        arguments[:power] = s
      end

      options.on("-s N", "--size N", Integer, "play game on board of size N") do | s |
        arguments[:size] = s
      end

      options.on("-e N", "--eliminate N", Integer,
        "maximum stones can be eliminated one time") do | e |
        arguments[:max_elimination] = e
      end

      options.on("-f", "--first", "player first") do |v|
        arguments[:usr_first] = true
      end

      options.on("-l", "--last",
        "player who eliminates the last stone lost the game") do |v|
        arguments[:last_win] = false
      end

      options.on_tail("-h", "--help", "show this message") do
        puts options
        exit
      end

      # options.on_tail("-t", "--test", "run test") do
      #   Test.test
      #   exit
      # end
    end

    option_parser.parse!(ARGV)

    arguments
  end

  def initialize(arguments = nil)
    if arguments.nil?
      arguments = {
        size: 6,
        max_elimination: 3,
        last_win: true,
        usr_first: false,
        power: 1
      }
    end

    @board = Board.new(arguments[:size], arguments[:max_elimination])
    @mode = arguments[:last_win] ? MODE_LAST_WIN : MODE_LAST_LOSE
    @bot_first = !arguments[:usr_first]
    @state = STATE_NOT_ENDED
    @number_of_trials = arguments[:power] * 200
  end

  def ended?
    @state != STATE_NOT_ENDED
  end

  def bot_eliminate
    return false if ended?

    root = Node.new(nil, nil, Node::PLAYER_USR, @board)

    @number_of_trials.times do
      node = root

      dup_board = @board.copy

      # select
      while node.possible_moves.empty? and node.children.length > 0 do
        node = node.select

        dup_board.eliminate node.move
      end

      # Expand
      unless node.possible_moves.empty?
        move = node.possible_moves.sample

        dup_board.eliminate move

        node = node.add_child(move, dup_board)
      end

      # Rollout
      count = 0

      until dup_board.random_eliminate.nil? do
        count += 1
      end

      winner = if @mode = MODE_LAST_WIN
        count.odd? ? 1 - node.player : node.player
      else
        count.odd? ? node.player : 1 - node.player
      end

      # Backpropagate
      until node.nil? do
        node.update winner
        node = node.parent
      end
    end

    node = root.children.max { | a, b | a.count_of_visits <=> b.count_of_visits }

    @board.eliminate node.move

    if @board.live_stones.empty?
      @state = (@mode == MODE_LAST_WIN) ? STATE_BOT_WIN : STATE_USR_WIN
    end

    true
  end

  def usr_eliminate(row1, col1, row2, col2)
    return false if ended?

    move = Move.new(Position.new(row1, col1), Position.new(row2, col2))

    return false unless @board.eliminate(move)

    if @board.live_stones.empty?
      @state = (@mode == MODE_LAST_WIN) ? STATE_USR_WIN : STATE_BOT_WIN
    end

    true
  end

  def play
    turn = 0

    unless @bot_first
      turn = 1

      p @board
    end

    loop do
      if turn.even?
        bot_eliminate
      else
        target = STDIN.gets.chomp

        positions = target.split(",").map { | s | s.to_i }

        if positions.length >= 4
          usr_eliminate(positions[0], positions[1], positions[2], positions[3])
        else
          usr_eliminate(positions[0], positions[1], positions[0], positions[1])
        end
      end

      p @board

      break if ended?

      turn += 1
    end

    p "You #{@state == STATE_BOT_WIN ? "LOSE" : "WIN"}"
  end
end

Game.new(Game.parse_args).play if __FILE__ == $0

~~~
