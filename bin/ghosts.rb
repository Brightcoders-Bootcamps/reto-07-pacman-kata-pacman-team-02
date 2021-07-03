# frozen_string_literal: true

require_relative('ghost_movement')

# This contains ghost behaivour
class Ghosts < GhostMovement
  attr_reader :position_x, :position_y, :grid

  def initialize(position_x, position_y, grid)
    @position_x = position_x
    @position_y = position_y
    @grid = grid
    grid[position_x][position_y] = :ghost
  end

  def intelligent_move(pacman_position_x, pacman_position_y, previous_state)
    dir_x = pacman_position_x - @position_x
    dir_y = pacman_position_y - @position_y
    prev_position_x = @position_x
    prev_position_y = @position_y

    x_movement(dir_x)
    y_movement(dir_y)

    state = grid[@position_x][@position_y]
    state = :gameover if pacman_position_x == @position_x && pacman_position_y == @position_y
    move_ghost(prev_position_x, prev_position_y, previous_state)

    state
  end
end
