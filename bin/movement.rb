# frozen_string_literal: true

require_relative 'eats'

# This class is to pacman can move
class PacmanMovement < Eats
  def move(direction, grid, score)
    @direction = direction
    prev_x = @position_x
    prev_y = @position_y
    @position_x -= 1 if direction == :UP && valid_movement(@position_x - 1, @position_y, grid)
    @position_y += 1 if direction == :RIGHT && valid_movement(@position_x, @position_y + 1, grid)
    @position_x += 1 if direction == :BOTTOM && valid_movement(@position_x + 1, @position_y, grid)
    @position_y -= 1 if direction == :LEFT && valid_movement(@position_x, @position_y - 1, grid)
    eats(prev_x, prev_y, grid, direction, score)
  end

  def valid_movement(position_x, position_y, grid)
    !(%i[vertical horizontal].include? grid[position_x][position_y])
  end
end
