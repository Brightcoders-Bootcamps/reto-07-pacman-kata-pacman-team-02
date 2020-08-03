require_relative "grid"
require_relative "pacman"
require_relative "ghosts"
require 'io/console'

class App
  def initialize
    @grid = Grid.new(20, 11)
    @pacman = Pacman.new(7, 9, :left)
    @ghost1 = Ghosts.new(5,8, :left)
    @ghost2 = Ghosts.new(5,9, :left) 
    @ghost3 = Ghosts.new(5,10, :left) 
    @ghost4 = Ghosts.new(5,11, :left)
    @score = 0
  end

  def start
    @complete_grid = @grid.generate_maze
    @ghost1.show_ghost(@complete_grid)
    @ghost2.show_ghost(@complete_grid)
    @ghost3.show_ghost(@complete_grid)
    @ghost4.show_ghost(@complete_grid)
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
    loop do 
      system('cls') || system('clear')
      puts "Level 1"
      puts "Score #{@final_score}"
      @grid.show_maze_two(@pacman)
      sleep(0.1)
      system('cls') || system('clear')
      puts "Level 1"
      puts "Score #{@final_score}"
      @grid.show_maze(@pacman)
      case @test
      when 'W'
        puts "Ingresa enter para iniciar"
      when 'A'
        @pacman.move(1, @complete_grid, @score)
        @test = 'A'
      when 'B'
        @pacman.move(3, @complete_grid, @score)
        @test = 'B'
      when 'C'
        @pacman.move(2, @complete_grid, @score)
        @test = 'C'
      when 'D'
        @pacman.move(4, @complete_grid, @score)
        @test = 'D'
      when 'Q'
        break
      end
      system("stty raw -echo")
      char = STDIN.read_nonblock(1) rescue nil
      system("stty -raw echo")
      if char != @test && char != nil
        @test = char
      end
      sleep(0.5)
    end
  end

  def score(grid, eats)
    @final_score = final_score
    if eats == 0 
    final_score += 1 
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