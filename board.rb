require_relative 'tile'

class Board
	attr_reader :grid_size

	def initialize(grid_size, num_bombs)
		@grid_size = grid_size
		@num_bombs = num_bombs

		populate_grid
	end

	def [](board_position)
		row, col = board_position
		@grid[row][col]
	end

	def render_board(show_all = false)
		@grid.map do |row|
			row.map do |tile|
				show_all ? tile.show_all : tile.reveal_tile
			end.join(" ")
		end.join("\n")
	end

	def render_end_board
		# Shows all tiles when game over
		render_board(true)
	end

	def won?
		@grid.flatten.all? { |tile| tile.revealed? != tile.bombed? }
	end

	def lost?
		@grid.flatten.any? { |tile| tile.bombed? && tile.revealed?}
	end

	private

	def seed_bombs
		bombs_planted = 0
		
		while bombs_planted < @num_bombs
			rand_position = Array.new(2) { rand(@grid_size)}

			tile = self[rand_position]

			if !tile.bombed?
				tile.place_bomb
				bombs_planted += 1
			end
		end
	end

	def populate_grid
		@grid = Array.new(@grid_size) do |row|
			Array.new(@grid_size) do |col|
				Tile.new(self, [row, col])
			end
		end

		seed_bombs
	end
	
end