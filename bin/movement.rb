# frozen_string_literal: true

require_relative 'eats'

# This class is to pacman can move
class PacmanMovement < Eats
  def move(direction, grid, score)
    @direction = direction
    prev_x = @position_x
    prev_y = @position_y
    pacman_direction(direction, grid)
    score = eats(prev_x, prev_y, grid, score)
    score
  end

  

  def valid_movement(position_x, position_y, grid)
    !(%i[vertical horizontal].include? grid[position_x][position_y])
  end
end
