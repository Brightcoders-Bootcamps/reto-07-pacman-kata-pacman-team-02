require_relative "grid"
require_relative "pacman"
require 'io/console'

class Ghosts
  attr_reader :position_x, :position_y, :direction

  def initialize (position_x, position_y, direction)
    @position_x = position_x
    @position_y = position_y
    @direction = direction
  end


  def show_ghost(grid)
    grid[@position_x][@position_y] = 8
  end

  def open_ghost_container(grid)
    grid[5][7] = 4
    grid[5][12] = 4
  end
end
