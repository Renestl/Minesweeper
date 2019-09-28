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
		# until @board.won? || @board.lost?
			puts @board.render_board

			choice, position = get_move
			take_turn(choice, position)
		# end

		#determine if board won or lost
		#if lost, board.render_end_board
	end

	def get_move
		action, row_pos, col_pos = gets.chomp.split(",")
		[action.downcase, [row_pos.to_i, col_pos.to_i]]
	end

	def take_turn(choice, position)
		tile = @board[position]

		if choice == 'f'
			tile.toggle_flag
		else choice == 'r'
			tile.revealed
		end
	end

	private

	

end