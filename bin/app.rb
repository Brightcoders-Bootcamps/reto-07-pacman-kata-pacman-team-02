# frozen_string_literal: true

require_relative 'grid'
require_relative 'pacman'
require_relative 'movement'
require_relative 'user_control'
require 'io/console'

# This class start the game
class App < UserControl
  attr_reader :grid, :pacman, :level

  def initialize
    @grid = Grid.new(20, 11)
    @pacman = Pacman.new(7, 9, 1)
    @score = 0
    @level = 1
  end

  def print_game
    direction = @pacman.direction
    print_board(Pacman::BIG[direction])
    sleep(0.1)
    print_board(Pacman::MINI[direction])
  end

  def print_board(pacman)
    system('cls') || system('clear')
    puts "\tPacman game"
    puts "Level #{@level}"
    puts "Score #{@score}"
    @grid.show_maze(pacman)
  end

end

app = App.new
app.start
