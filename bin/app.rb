# frozen_string_literal: true

require_relative 'grid'
require_relative 'pacman'
require_relative 'ghosts'
require_relative 'movement'
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
    @final_grid = @grid.generate_maze

    char = 'W'
    @test = 'W'
    @jump = false
    prev_value = 6
    loop do
      if @score == 103
        @level = 2
        @grid.generate_maze_level_two
        @score = 0
      end
      if prev_value == :gameover
        puts 'Game Over'
        break
      end
      print_game unless @jump
      case @test
      when 'A'
        @score = @pacman.move(:UP, @final_grid, @score)
        @test = 'A'
        print_game
      when 'B'
        @score = @pacman.move(:BOTTOM, @final_grid, @score)
        @test = 'B'
        print_game
      when 'C'
        @score = @pacman.move(:RIGHT, @final_grid, @score)
        @test = 'C'
        print_game
      when 'D'
        @score = @pacman.move(:LEFT, @final_grid, @score)
        @test = 'D'
        print_game
      when 'Q'
        break
      end
      # prev_value = @ghost1.intelligent_move(@pacman.position_x, @pacman.position_y, prev_value)
      char = user_data
      if char != @test && !char.nil?
        @test = char
        @jump = true
      end
      sleep(0.5)
    end
  end

  def user_data
    system('stty raw -echo')
      char = begin
               STDIN.read_nonblock(1)
             rescue StandardError
               nil
             end
    system('stty -raw echo')
    char
  end

  def print_game
    print_board(Pacman::BIG[@pacman.direction])
    sleep(0.1)
    print_board(Pacman::MINI[@pacman.direction])
  end

  def start_ghosts
    @intelligent_ghots      = Ghosts.new(5,8, :left)
    @most_intelligent_ghost = Ghosts.new(5,9, :left) 
    @random_ghost           = Ghosts.new(5,10, :left) 
    @most_random_ghost      = Ghosts.new(5,11, :left)
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
