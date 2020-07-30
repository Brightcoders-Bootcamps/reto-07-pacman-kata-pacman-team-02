require_relative "grid"
require_relative "pacman"
require 'io/console'

class App
  def initialize
    @grid = Grid.new(20, 11)
    @pacman = Pacman.new(7, 9, :left)
  end

  def start
    @complete_grid = @grid.generate_maze
    @grid.show_maze(@pacman)
    move
  end

  def move
    user_input = $stdin.getch      
    case user_input  
    when 'A'
        puts "up TEST "
        @pacman.move(1, @complete_grid)
        puts "#{@pacman.position_x} - #{@pacman.position_y} - #{@complete_grid[@pacman.position_x][@pacman.position_y]}"
        @grid.show_maze(@pacman)
        move
    when 'B'
        puts "down"
        @pacman.move(3, @complete_grid)
        puts "#{@pacman.position_x} - #{@pacman.position_y}"
        @grid.show_maze(@pacman)
        move
    when 'C'
        puts "right"
        @pacman.move(2, @complete_grid)
        puts "#{@pacman.position_x} - #{@pacman.position_y}"
        @grid.show_maze(@pacman)
        move
    when 'D'
        puts "left"
        @pacman.move(4, @complete_grid)
        puts "#{@pacman.position_x} - #{@pacman.position_y}"
        @grid.show_maze(@pacman)
        move
    end
  end
end

app = App.new
app.start