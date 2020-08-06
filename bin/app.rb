# frozen_string_literal: true

require_relative 'grid'
require_relative 'pacman'
require_relative 'ghosts'
require 'io/console'

# This class start the game
class App
  def initialize
    @grid = Grid.new(20, 11)
    @pacman = Pacman.new(7, 9, 1)
    @score = 0
    @level = 1
  end

  def start
    @complete_grid = @grid.generate_maze
    @ghost1 = Ghosts.new(5, 8, @complete_grid)
    @ghost2 = Ghosts.new(5, 9, @complete_grid)
    @ghost3 = Ghosts.new(5, 10, @complete_grid)
    @ghost4 = Ghosts.new(5, 11, @complete_grid)

    char = 'W'
    @test = 'W'
    @jump = false
    prev_value = 6
    loop do
      if @score == 103
        @level = 2
        @complete_grid = @grid.generate_maze_level_two
        @score = 0
      end
      if prev_value == :gameover
        puts 'Game Over'
        break
      end
      print_board unless @jump
      case @test
      when 'W'
        puts 'Ingresa enter para iniciar'
      when 'A'
        @score = @pacman.move(1, @complete_grid, @score)
        @test = 'A'
        print_board
      when 'B'
        @score = @pacman.move(3, @complete_grid, @score)
        @test = 'B'
        print_board
      when 'C'
        @score = @pacman.move(2, @complete_grid, @score)
        @test = 'C'
        print_board
      when 'D'
        @score = @pacman.move(4, @complete_grid, @score)
        @test = 'D'
        print_board
      when 'Q'
        break
      end
      prev_value = @ghost1.intelligent_move(@pacman.position_x, @pacman.position_y, prev_value)

      system('stty raw -echo')
      char = begin
               STDIN.read_nonblock(1)
             rescue StandardError
               nil
             end
      system('stty -raw echo')
      puts "You press #{char}"
      if char != @test && !char.nil?
        @test = char
        @jump = true
      end
      sleep(0.5)
    end
  end

  def print_board
    system('cls') || system('clear')
    puts "\tPacman game"
    puts 'Level 1'
    puts "Score #{@score}"
    @grid.show_maze(Pacman::BIG[@pacman.direction])
    # @grid.show_maze(Pacman::BIG[@pacman.direction])
    sleep(0.1)
    system('cls') || system('clear')
    puts "\tPacman game"
    puts 'Level #{@level}'
    puts "Score #{@score}"
    @grid.show_maze(Pacman::MINI[@pacman.direction])
  end
end

app = App.new
app.start
