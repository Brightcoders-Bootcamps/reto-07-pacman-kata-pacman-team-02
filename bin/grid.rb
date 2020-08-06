# frozen_string_literal: true

require 'colorize'
require_relative 'maze_level_two'
require_relative 'maze_level_one'

# This is the class to create a grid to the game
class Grid
  GAME_ELEMENTS = {
    horizontal: '▀▀▀'.blue,
    vertical: ' █ '.blue,
    horizontal_border: '▀▀▀'.blue,
    vertical_border: ' █ '.blue,
    food: ' • '.white,
    empty: '   ',
    ghost: ' ▲ '.red

  }.freeze

  def initialize(width, height)
    @width = width
    @height = height
    @grid = Array.new(height) { Array.new(width) { :food } }
  end

  def generate_maze
    laberinto = MazeLevelOne.new(@grid)
    laberinto.create_maze(@width - 1, @height - 1)
  end

  def generate_maze_level_two
    laberinto = MazeLevelTwo.new(@grid)
    laberinto.create_maze(@width - 1, @height - 1)
  end

  def show_maze(pacman)
    @grid.each do |row|
      row.each do |column|
        print GAME_ELEMENTS[column]
        print pacman if column == :pacman
      end
      puts
    end
  end
end
