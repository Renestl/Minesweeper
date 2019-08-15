require_relative 'tile'

class Board
	attr_reader :grid	

	def initialize(size = 4)
		@size = size

		populate_grid
	end

	def populate_grid
		@grid = Array.new(@size) do |row|
			Array.new(@size) do |col|
				Tile.new(self, [row, col])
			end
		end

		# populate_bombs
	end


	def populate_bombs
		bombs = @size * 0.20

		while self.num_bombs < bombs
			rand_row = rand(0...@grid.length)
			rand_col = rand(0...@grid.length)
			rand_position = [rand_row, rand_col]

			self[rand_position] = :*
		end
	end

	def num_bombs
		@grid.flatten.count(:*)
	end

	def [](board_position)
		row, col = board_position
		@grid[row][col]
	end

	def []=(position, value)
		row, col = position
		@grid[row][col] = value
	end
	
end