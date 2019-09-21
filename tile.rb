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
end