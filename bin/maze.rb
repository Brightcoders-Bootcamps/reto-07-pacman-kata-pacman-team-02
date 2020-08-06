# frozen_string_literal: true

require 'pry'

# This class add restrictions to pacman movement
class Maze
  def initialize(grid)
    @grid = grid
  end

  def horizontal
    raise StandardError, 'Este metodo se encarga de crear los muros horizontales.to_english'
  end

  def vertical
    raise StandardError, 'Implementar este tambien'
  end

  def create_maze(width, height)
    horizontal
    vertical
    generate_maze(width, height)
  end

  def generate_maze(width, height)
    (0..height - 1).each do |row|
      (0..width - 1).each do |column|
        @grid[row][column] = 3 if row.zero? || row == height - 1
        @grid[row][column] = 4 if column.zero? || column == width - 1
      end
    end
  end

  private

  def create_wall(rows, columns, value)
    rows.each do |row|
      columns.each do |column|
        @grid[row][column] = value
      end
    end
  end
end
