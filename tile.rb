class Tile	
	NEIGHBOR_DIRECTIONS = [[-1,-1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]

	attr_reader :position

	def initialize(board, position)
		@board, @position = board, position
		@bombed, @flagged, @revealed = false, false, false
	end

	def bombed?
		@bombed
	end

	def flagged?
		@flagged
	end

	def revealed?
		@revealed
	end

	def place_bomb
		@bombed = true
	end

	def revealed
		return self if flagged?
		return self if revealed?

		@revealed = true
		
		#result if tile not bombed && neighbor_bomb_count == 0
		#look at list of neighbors and do the same result

		if !bombed? && neighbor_bomb_count == 0
			neighbors.each(&:revealed)
		end
	end

	def toggle_flag
		@flagged = !@flagged unless revealed?
	end

	def reveal_tile
		# reveal tile when selected by player
		if flagged?
			"F"
		elsif revealed?
			neighbor_bomb_count == 0 ? "_" : neighbor_bomb_count.to_s
		else
			"*"
		end
	end

	def show_all
		# show full board when game ends
		if flagged?
			# Mark actual flagged bombs vs false bombs
			bombed? ? "F" : "f"
		elsif bombed?
			# "X" marks hit bomb
			revealed? ? "X" : "B"
		else
			neighbor_bomb_count == 0 ? "_" : neighbor_bomb_count.to_s
		end
	end

	def inspect
		{
			'bombed' => @bombed,
			'flagged' => @flagged,
			'revealed' => @revealed,
			'position' => @position
		}.inspect
	end

	def neighbors
		neighbors_arr = []

		NEIGHBOR_DIRECTIONS.map do |direction|
			neighbors_arr << [position[0] + direction[0], position[1] + direction[1]]	
		end
		
		neighbors = neighbors_arr.select do |row, col|
			[row, col].all? do |coord|
				coord.between?(0, @board.grid_size - 1)
			end
		end

		neighbors.map { |pos| @board[pos] }
	end

	def neighbor_bomb_count
		neighbors.select(&:bombed?).count
	end

end