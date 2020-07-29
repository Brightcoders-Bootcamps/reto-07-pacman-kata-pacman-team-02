# frozen_string_literal: true

require_relative('laberinto')

# This is the class to create a grid to the game
class Grid

    def initialize(width, height)
      @width = width
      @height = height
      @grid = Array.new(height) { Array.new(width) { 0 } }
    end

    def generate_grid
      laberinto = Laberinto.new(@grid)
      laberinto.generate_maze
      for row in 0..(@height - 1 )
        for column in 0..(@width - 1)
          @grid[row][column] = 2 if row == 0 || row == @height - 1
          @grid[row][column] = 1 if column == 0 || column == @width - 1
        end
      end
    end

    def show_maze
      @grid.each do |row|
        row.each do |column|
          print " — " if column == 2
          print " | " if column == 1 
          print " . " if column == 0
        end
        puts
      end
    end
end

new_grid = Grid.new(20, 11) 
new_grid.generate_grid
new_grid.show_maze
