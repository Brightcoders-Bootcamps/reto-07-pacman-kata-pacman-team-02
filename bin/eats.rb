# frozen_string_literal: true

class Eats
  def eats(prev_x, prev_y, grid, direction, score)
    current_position = grid[@position_x][@position_y]
    if grid[prev_x][prev_y] == current_position
      grid[@position_x][@position_y] = :pacman
    elsif current_position == :horizontal_border && direction == :UP
      change_score(prev_x, prev_y, grid)
      @position_x = grid.length - 2
    elsif current_position == :horizontal_border && direction == :BOTTOM
      change_score(prev_x, prev_y, grid)
      @position_x = 1
    elsif current_position == :vertical_border && direction == :RIGHT
      change_score(prev_x, prev_y, grid)
      @position_y = 1
    elsif current_position == :vertical_border && direction == :LEFT
      change_score(prev_x, prev_y, grid)
      @position_y = grid[0].length - 2
    else
      change_score(prev_x, prev_y, grid)
      grid[@position_x][@position_y] = :pacman
    end
    grid[@position_x][@position_y] = :pacman
    score
  end

  def change_score(prev_x, prev_y, grid)
    score += 1 if grid[@position_x][@position_y] == 0
    grid[prev_x][prev_y] = :empty
  end
end
