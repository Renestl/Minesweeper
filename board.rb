require_relative 'tile'

class Board
	attr_reader :grid_size

	def initialize(grid_size = 4)
		@grid_size = grid_size

		populate_grid
	end

	def [](board_position)
		row, col = board_position
		@grid[row][col]
	end

	def populate_grid
		@grid = Array.new(@grid_size) do |row|
			Array.new(@grid_size) do |col|
				Tile.new(self, [row, col])
			end
		end

		seed_bombs
	end

	def seed_bombs
		num_bombs = 0
		bombs = (@grid_size * @grid_size) * 0.25

		while num_bombs < bombs
			rand_position = Array.new(2) { rand(@grid_size)}

			tile = self[rand_position]

			if !tile.bombed?
				tile.place_bomb
				num_bombs += 1
			end
		end
	end
	
end