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

	# def inspect
	# 	{
	# 		'bombed' => @bombed,
	# 		'flagged' => @flagged,
	# 		'revealed' => @revealed
	# 	}.inspect
	# end

	def neighbors
	end

	def neighbor_bomb_count
	end
end