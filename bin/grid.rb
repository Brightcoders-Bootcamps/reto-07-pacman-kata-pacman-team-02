# encoding: utf-8
# frozen_string_literal: true

require 'colorize'
require_relative('maze_level_one')
require_relative('maze_level_two')
require config.encoding = "utf-8"

# This is the class to create a grid to the game
class Grid
  def initialize(width, height)
    @width = width
    @height = height
    @grid = Array.new(height) { Array.new(width) { 0 } }
  end

  def generate_maze
    laberinto = MazeLevelOne.new(@grid)
    laberinto.generate_maze
    (0..(@height - 1)).each do |row|
      (0..(@width - 1)).each do |column|
        @grid[row][column] = 3 if row == 0 || row == @height - 1
        @grid[row][column] = 4 if column == 0 || column == @width - 1
      end
    end
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
        show_pacman_two(pacman) if column == 7
        print '   ' if column == 6
        print ' ▲ '.red if column == 8
      end
      puts
    end
  end

  def show_maze_two(pacman)
    @grid.each do |row|
      row.each do |column|
        print '▀▀▀'.blue if column == :horizontal
        print ' █ '.blue if column == :vertical
        print '▀▀▀'.blue if column == 3
        print ' █ '.blue if column == 4
        print ' • '.white if column == 0
        show_pacman_two(pacman) if column == 7
        print '   ' if column == 6
        print ' ▲ '.red if column == 8
      end
      puts
    end
  end

  def show_pacman(pacman)
    print ' Ս '.yellow if pacman.direction == 1
    print ' C '.yellow if pacman.direction == 2
    print ' Ո '.yellow if pacman.direction == 3
    print ' Ɔ '.yellow if pacman.direction == 4
  end

  def show_pacman_two(pacman)
    print ' u '.yellow if pacman.direction == 1
    print ' c '.yellow if pacman.direction == 2
    print ' n '.yellow if pacman.direction == 3
    print ' ͻ '.yellow if pacman.direction == 4
  end
end

# u
# c
# n
# ͻ
