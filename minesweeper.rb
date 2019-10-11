require 'yaml'
require_relative 'board'

class MinesweeperGame
	BOARD_SIZES = {
		easy: {grid_size: 9, num_bombs: 10},
		medium: {grid_size: 16, num_bombs: 40},
		hard: {grid_size: 25, num_bombs: 99}
	}

	def initialize(size = :easy)
		board_size = BOARD_SIZES[size]
		@board = Board.new(board_size[:grid_size], board_size[:num_bombs])
	end

	def play
		until @board.won? || @board.lost?
			puts @board.render_board

			choice, position = get_move
			take_turn(choice, position)
		end

		if @board.won?
			puts "You Win!"
		elsif @board.lost?
			puts "Bomb Activated, Game Over!"
			puts @board.render_end_board
		end
	end

	private

	def get_move
		action, row_pos, col_pos = nil, nil, nil

		puts "Please enter an action (r to reveal, f to flag) and a position (e.g. r, 1, 0)"

		if gets[0].chomp.to_s == "s"
			save_game
			play
		else
			until valid_action(action) && valid_position([row_pos.to_i, col_pos.to_i])
				puts "Please enter an action (r to reveal, f to flag) and a position (e.g. r,1,0)"
				action, row_pos, col_pos = gets.chomp.split(",")
			end
	
			[action.downcase, [row_pos.to_i, col_pos.to_i]]
		end
	end

	def take_turn(choice, position)
		tile = @board[position]

		case choice
		when 'f'
			tile.toggle_flag
		when 'r'
			tile.revealed
		end
	end

	def save_game
		puts "Please enter filename to save game at:"
		filename =  gets.chomp
		File.write(filename, YAML.dump(self))
		puts "Game saved to #{filename}!"
	end

	def valid_action(action)
		action == "r" || action == "f"
	end

	def valid_position(position)
		row_pos, col_pos = position

		position.is_a?(Array) && 
			position.length == 2 &&
		  position.all? { |x| x.between?(0, @board.grid_size - 1)}
	end
end

if __FILE__ == $PROGRAM_NAME 
	case ARGV.count
	when 0
		puts "Enter game level:"
		size = gets.chomp.to_sym
	
		game = MinesweeperGame.new(size).play
	when 1
		YAML.load(File.read(ARGV.shift)).play
	end
end