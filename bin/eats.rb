# frozen_string_literal: true

require_relative('wraps_around')

class Eats < WrapsAround
  def eats(prev_x, prev_y, grid, score)
    current_position = grid[@position_x][@position_y]
    grid[@position_x][@position_y] = :pacman if grid[prev_x][prev_y] == current_position
    score = wraps_around(current_position, prev_x, prev_y, grid, score)
    score
  end
end
