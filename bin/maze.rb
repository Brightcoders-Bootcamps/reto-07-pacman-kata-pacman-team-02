# frozen_string_literal: true

# This class add restrictions to pacman movement
class Maze
  def initialize(grid)
    @grid = grid
  end

  def generate_maze
    horizontal
    vertical
  end

  def create_wall(rows, columns, value)
    rows.each do |row|
      columns.each do |column|
        @grid[row][column] = value
      end
    end
  end
end
