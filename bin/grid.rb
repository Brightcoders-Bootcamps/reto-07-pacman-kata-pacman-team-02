# frozen_string_literal: true

require 'colorize'
require_relative 'maze_level_two'
require_relative 'maze_level_one'

# This is the class to create a grid to the game
class Grid
  def initialize(width, height)
    @width = width
    @height = height
    @grid = Array.new(height) { Array.new(width) { 0 } }
  end

  def generate_maze
    laberinto = MazeLevelOne.new(@grid)
    laberinto.create_maze(@width, @height)

    @grid
  end

  def generate_maze_level_two
    laberinto = MazeLevelTwo.new(@grid)
    laberinto.generate_maze
    (0..(@height - 1)).each do |row|
      (0..(@width - 1)).each do |column|
        @grid[row][column] = 3 if row == 0 || row == @height - 1
        @grid[row][column] = 4 if column == 0 || column == @width - 1
      end
    end
    @grid
  end

  def show_maze(pacman)
    @grid.each do |row|
      row.each do |column|
        print '▀▀▀'.blue if column == :horizontal
        print ' █ '.blue if column == :vertical
        print '▀▀▀'.blue if column == 3
        print ' █ '.blue if column == 4
        print ' • '.white if column == 0
        print pacman if column == 7
        print '   ' if column == 6
        print ' ▲ '.red if column == 8
      end
      puts
    end
  end
end

# u
# c
# n
# ͻ
