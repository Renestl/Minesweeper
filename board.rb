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

		populate_bombs
	end

	def populate_bombs
		bombs = (@size * @size) * 0.25
		num_bombs = 0

		while num_bombs < bombs
			rand_row = rand(0...@grid.length)
			rand_col = rand(0...@grid.length)

			@grid[rand_row][rand_col].place_bomb

			num_bombs += 1
		end
	end

	def render_board
		display = []

		grid.each do |row|
			row.each do |tile|
				if tile.flagged
					display << "F"
				elsif tile.revealed
					display << (tile.bombed ? "B" : tile.neighbor_bomb_count)
				else
					display << "* "
				end
			end
			display << "\n"
		end

		puts display.join("")

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