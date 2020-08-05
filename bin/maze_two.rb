# frozen_string_literal: true

# This class add restrictions to pacman movement
class MazeTwo
  def initialize(grid)
    @grid = grid
  end

  def generate_maze
    horizontal
    vertical
  end

  def horizontal
    create_wall([2, 8], [1, 2, 3, -3, -2, -4, *(7..12)], :horizontal)
    create_wall([4, 6], [4, 5, -5, -6, *(7..12)], :horizontal)
  end

  def vertical
    create_wall([3, -4], [2, -3], :vertical)
    create_wall([1, -2], [5, -6], :vertical)
    create_wall([5], [7, 12], :vertical)
  end

  def create_wall(rows, columns, value)
    rows.each do |row|
      columns.each do |column|
        @grid[row][column] = value
      end
    end
  end
end
