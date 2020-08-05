require_relative "grid"
require_relative "pacman"
require_relative "ghosts"
require 'io/console'

class App
  def initialize
    @grid = Grid.new(20, 11)
    @pacman = Pacman.new(7, 9, :left)
    @score = 0
    @level = 1
  end

  def start
    @complete_grid = @grid.generate_maze
    @ghost1 = Ghosts.new(5,8, @complete_grid)
    @ghost2 = Ghosts.new(5,9, @complete_grid) 
    @ghost3 = Ghosts.new(5,10, @complete_grid) 
    @ghost4 = Ghosts.new(5,11, @complete_grid)
    #@ghost1.show_ghost(@complete_grid)
    #@ghost2.show_ghost(@complete_grid)
    #@ghost3.show_ghost(@complete_grid)
    #@ghost4.show_ghost(@complete_grid)
    ##Ghosts.open_ghost_container(@complete_grid)
    #@ghost4.open_ghost_container(@complete_grid)
    #@complete_grid[4][8] = 6
    #@complete_grid[4][9] = 6
    #@complete_grid[4][10] = 6
    #@complete_grid[5][8] = 8

    # @complete_grid = @ghost1.position_ghosts(@complete_grid)
    # @complete_grid = @ghost2.position_ghosts(@complete_grid)
    # @complete_grid = @ghost3.position_ghosts(@complete_grid)
    # @complete_grid = @ghost4.position_ghosts(@complete_grid)
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
        puts "Game Over"
        break
      end
      if !@jump
        puts "You press #{char}"
        system('cls') || system('clear')
        puts "\tPacman game"
        puts "Level 1"
        puts "Score #{@score}"
        @grid.show_maze_two(@pacman)
        sleep(0.1)
        system('cls') || system('clear')
        puts "\tPacman game"
        puts "Level #{@level}"
        puts "Score #{@score}"
        @grid.show_maze(@pacman)
      end
      case @test
      when 'W'
        puts "Ingresa enter para iniciar"
      when 'A'
        @score = @pacman.move(1, @complete_grid, @score)
        @test = 'A'
        puts "You press #{char}"
        system('cls') || system('clear')
        puts "\tPacman game"
        puts "Level 1"
        puts "Score #{@score}"
        @grid.show_maze_two(@pacman)
        sleep(0.1)
        system('cls') || system('clear')
        puts "\tPacman game"
        puts "Level 1"
        puts "Score #{@score}"
        @grid.show_maze(@pacman)
      when 'B'
        @score = @pacman.move(3, @complete_grid, @score)
        @test = 'B'
        puts "You press #{char}"
        system('cls') || system('clear')
        puts "\tPacman game"
        puts "Level 1"
        puts "Score #{@score}"
        @grid.show_maze_two(@pacman)
        sleep(0.1)
        system('cls') || system('clear')
        puts "\tPacman game"
        puts "Level 1"
        puts "Score #{@score}"
        @grid.show_maze(@pacman)
      when 'C'
        @score = @pacman.move(2, @complete_grid, @score)
        @test = 'C'
        puts "You press #{char}"
        system('cls') || system('clear')
        puts "\tPacman game"
        puts "Level 1"
        puts "Score #{@score}"
        @grid.show_maze_two(@pacman)
        sleep(0.1)
        system('cls') || system('clear')
        puts "\tPacman game"
        puts "Level 1"
        puts "Score #{@score}"
        @grid.show_maze(@pacman)
      when 'D'
        @score = @pacman.move(4, @complete_grid, @score)
        @test = 'D'
        puts "You press #{char}"
        system('cls') || system('clear')
        puts "\tPacman game"
        puts "Level 1"
        puts "Score #{@score}"
        @grid.show_maze_two(@pacman)
        sleep(0.1)
        system('cls') || system('clear')
        puts "\tPacman game"
        puts "Level 1"
        puts "Score #{@score}"
        @grid.show_maze(@pacman)
      when 'Q'
        break
      end
      prev_value = @ghost1.intelligent_move(@pacman.position_x, @pacman.position_y, prev_value)
      #@ghost2.intelligent_move(@complete_grid, @pacman, prev_value)
      #@ghost3.random_move(@complete_grid, rand(1..10), rand(1..5))
      #@ghost4.random_move(@complete_grid, rand(11..19), rand(6..10))
      system("stty raw -echo")
      char = STDIN.read_nonblock(1) rescue nil
      system("stty -raw echo")
      puts "You press #{char}"
      if char != @test && char != nil
        @test = char
        @jump = true
      end
      sleep(0.5)
    end
  end

  # def move()
  #   current_move = $stdin.getch
  #   case current_move
  #   when 'A'
  #       puts "up TEST "
  #       @pacman.move(1, @complete_grid)
  #       puts "#{@pacman.position_x} - #{@pacman.position_y} - #{@complete_grid[@pacman.position_x][@pacman.position_y]}"
  #       system('cls') || system('clear')
  #       @grid.show_maze_two(@pacman)
  #       sleep(0.5)
  #       system('cls') || system('clear')
  #       @grid.show_maze(@pacman)
  #       #move('A')
  #       move
  #   when 'B'
  #       puts "down"
  #       @pacman.move(3, @complete_grid)
  #       puts "#{@pacman.position_x} - #{@pacman.position_y}"
  #       system('cls') || system('clear')
  #       @grid.show_maze_two(@pacman)
  #       sleep(0.5)
  #       system('cls') || system('clear')
  #       @grid.show_maze(@pacman)
  #       #move('B')
  #       move
  #   when 'C'
  #       puts "right"
  #       @pacman.move(2, @complete_grid)
  #       puts "#{@pacman.position_x} - #{@pacman.position_y}"
  #       system('cls') || system('clear')
  #       @grid.show_maze_two(@pacman)
  #       sleep(0.5)
  #       system('cls') || system('clear')
  #       @grid.show_maze(@pacman)
  #       #move('C')
  #       move
  #   when 'D'
  #       puts "left"
  #       @pacman.move(4, @complete_grid)
  #       puts "#{@pacman.position_x} - #{@pacman.position_y}"
  #       system('cls') || system('clear')
  #       @grid.show_maze_two(@pacman)
  #       sleep(0.5)
  #       system('cls') || system('clear')
  #       @grid.show_maze(@pacman)
  #       #move('D')
  #       move
  #   end
  # end
end

app = App.new
app.start
