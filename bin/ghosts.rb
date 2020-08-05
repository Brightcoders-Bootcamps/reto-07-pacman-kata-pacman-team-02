# frozen_string_literal: true

# This contains ghost behaivour
class Ghosts
  attr_reader :position_x, :position_y, :direction

  def initialize(position_x, position_y, direction)
    @position_x = position_x
    @position_y = position_y
    @direction = direction
  end

  def show_ghost(grid)
    grid[@position_x][@position_y] = 8
  end

  def self.open_ghost_container(grid)
    grid[4][8] = 6
    grid[4][9] = 6
    grid[4][10] = 6
    grid[4][11] = 6
  end

  def move(pacman, grid)
    # Lalo-ba was here 👋🏻
    dir_x = pacman.position_x - @position_x
    dir_y = pacman.position_y - @position_y
    @prev_position_x = @position_x
    @prev_position_y = @position_y
    unless dir_x.zero?
      @position_x -= 1 if dir_x.negative? && !([:vertical, :horizontal].include? grid[@position_x - 1][@position_y])
      @position_x += 1 if dir_x.positive? && (grid[@position_x + 1][@position_y] != :horizontal && grid[@position_x + 1][@position_y] != :vertical)
    end

    unless dir_y.zero?
      @position_y -= 1 if dir_y.negative? && (grid[@position_x][@position_y - 1] != :horizontal && grid[@position_x][@position_y - 1] != :vertical)
      @position_y += 1 if dir_y.positive? && (grid[@position_x][@position_y + 1] != :horizontal && grid[@position_x][@position_y + 1] != :vertical)
    end
  
    puts "Ghost move"
    puts "#{@position_x} - #{@position_y}"
    #if pacman.position_x < @position_x || pacman.position_y < @position_y
    #  @position_x -= 1 if grid[@position_x - 1][@position_y] != :horizontal && grid[@position_x - 1][@position_y] != :vertical  # Abajo
    #  @position_y -= 1 if grid[@position_x][@position_y - 1] != :horizontal && grid[@position_x][@position_y - 1] != :vertical  # Derecha
    #end
    # @position_x -= 1 if grid[@position_x - 1][@position_y] != :horizontal && grid[@position_x - 1][@position_y] != :vertical  # Arriba
    # @position_x += 1 if grid[@position_x + 1][@position_y] != :horizontal && grid[@position_x + 1][@position_y] != :vertical  # Abajo
    # @position_y -= 1 if grid[@position_x][@position_y - 1] != :horizontal && grid[@position_x][@position_y - 1] != :vertical  # Izquierda 
    puts "#{@position_x} - #{@position_y}"
    grid[@position_x][@position_y] = 8

    unless @prev_position_x == @position_x && @prev_position_y == @position_y
      grid[@prev_position_x][@prev_position_y] == 6 ? grid[@prev_position_x][@prev_position_y] = 6 : grid[@prev_position_x][@prev_position_y] = 0
    end
  end

  def random_move(grid, rand_number_x, rand_number_y)
    dir_x = rand_number_x - @position_x
    dir_y = rand_number_y - @position_y
    @prev_position_x = @position_x
    @prev_position_y = @position_y
    unless dir_x.zero?
      @position_x -= 1 if dir_x.negative? && !([:vertical, :horizontal].include? grid[@position_x - 1][@position_y])
      @position_x += 1 if dir_x.positive? && (grid[@position_x + 1][@position_y] != :horizontal && grid[@position_x + 1][@position_y] != :vertical)
    end

    unless dir_y.zero?
      @position_y -= 1 if dir_y.negative? && (grid[@position_x][@position_y - 1] != :horizontal && grid[@position_x][@position_y - 1] != :vertical)
      @position_y += 1 if dir_y.positive? && (grid[@position_x][@position_y + 1] != :horizontal && grid[@position_x][@position_y + 1] != :vertical)
    end
    
    grid[@position_x][@position_y] = 8

    unless @prev_position_x == @position_x && @prev_position_y == @position_y
      grid[@prev_position_x][@prev_position_y] == 6 ? grid[@prev_position_x][@prev_position_y] = 6 : grid[@prev_position_x][@prev_position_y] = 0
      grid[@prev_position_x][@prev_position_y] == 0 ? grid[@prev_position_x][@prev_position_y] = 0 : grid[@prev_position_x][@prev_position_y] = 6
    end
  end

  def intelligent_move(grid, pacman)
    dir_x = pacman.position_x - @position_x
    dir_y = pacman.position_y - @position_y
    @prev_position_x = @position_x
    @prev_position_y = @position_y
    unless dir_x.zero?
      @position_x -= 1 if dir_x.negative? && !([:vertical, :horizontal].include? grid[@position_x - 1][@position_y])
      @position_x += 1 if dir_x.positive? && (grid[@position_x + 1][@position_y] != :horizontal && grid[@position_x + 1][@position_y] != :vertical)
    end

    unless dir_y.zero?
      @position_y -= 1 if dir_y.negative? && (grid[@position_x][@position_y - 1] != :horizontal && grid[@position_x][@position_y - 1] != :vertical)
      @position_y += 1 if dir_y.positive? && (grid[@position_x][@position_y + 1] != :horizontal && grid[@position_x][@position_y + 1] != :vertical)
    end
    
    prev_value = grid[@position_x][@position_y]
    grid[@position_x][@position_y] = 8
    
    #unless @prev_position_x == @position_x && @prev_position_y == @position_y
    # grid[@prev_position_x][@prev_position_y] == 6 ? grid[@prev_position_x][@prev_position_y] = 6 : grid[@prev_position_x][@prev_position_y] = 0
    # grid[@prev_position_x][@prev_position_y] == 0 ? grid[@prev_position_x][@prev_position_y] = 0 : grid[@prev_position_x][@prev_position_y] = 6
    #end
   end


end
