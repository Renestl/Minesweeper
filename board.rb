require_relative 'tile'

class Board
	attr_reader :grid_size

	def initialize(grid_size = 9)
		@grid_size = grid_size

		populate_grid
	end

	def [](board_position)
		row, col = board_position
		@grid[row][col]
	end

	def render_board
		@grid.map do |row|
			row.map do |tile|
				tile.reveal_tile
				# render_end_board ? tile.revealed : tile.reveal_tile
			end.join("")
		end.join("\n")
	end

	def render_end_board
		# Shows all tiles when game over

		#set all tiles revealed = true
	end

	def won?
		#opposite of lost?
	end

	def lost?
		# if tile revealed? && bombed?, game over
	end

	private

	def seed_bombs
		num_bombs = 0
		bombs = (@grid_size * @grid_size) / 4

		while num_bombs < bombs
			rand_position = Array.new(2) { rand(@grid_size)}

			tile = self[rand_position]

			if !tile.bombed?
				tile.place_bomb
				num_bombs += 1
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