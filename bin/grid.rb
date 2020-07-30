# frozen_string_literal: true

require 'colorize'
require_relative('maze')

# This is the class to create a grid to the game
class Grid

    def initialize(width, height)
      @width = width
      @height = height
      @grid = Array.new(height) { Array.new(width) { 0 } }
    end

    def generate_maze
      laberinto = Maze.new(@grid)
      laberinto.generate_maze
      for row in 0..(@height - 1 )
        for column in 0..(@width - 1)
          @grid[row][column] = 2 if row == 0 || row == @height - 1
          @grid[row][column] = 1 if column == 0 || column == @width - 1
        end
      end
      @grid
    end

    def show_maze(pacman)
      @grid.each do |row|
        row.each do |column|
          print " ▬ ".blue if column == 2
          print " ▌ ".blue if column == 1 
          print " • ".peach if column == 0
          show_pacman(pacman) if column == 7
          print "   " if column == 6
        end
        puts
      end
    end

    def show_pacman(pacman)
      print " Ս ".yellow if pacman.direction == 1
      print " C ".yellow if pacman.direction == 2
      print " Ո ".yellow if pacman.direction == 3
      print " Ɔ ".yellow if pacman.direction == 4
    end
end