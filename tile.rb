require_relative 'board'

class Tile
	attr_reader :bombed
	attr_accessor :revealed, :flagged

	NEIGHBOR_DIRECTIONS = [[-1,-1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]

	def initialize(board, position)
		@board = board
		@bombed = false
		@flagged = false 
		@revealed = false
		@position = position
	end


	def neighbors
		neighbors = []

		NEIGHBOR_DIRECTIONS.each do |direction|
			new_position = [@position[0] + direction[0], @position[1] + direction[1]]
			neighbor_tile = @board[new_position]
			neighbors << neighbor_tile unless neighbor_tile.nil?
		end

		neighbors.uniq
	end

	def neighbor_bomb_count
		bomb_count = 0

		neighbors.each do |tile|
			if tile.bombed
				bomb_count += 1
			end
		end

		p bomb_count
	end	

end