class GhostMovement
  def move_ghost(prev_position_x, prev_position_y, previous_state)
    grid[@position_x][@position_y] = 8
    unless prev_position_x == @position_x && prev_position_y == @position_y
      grid[prev_position_x][prev_position_y] = previous_state
    end
  end

  def x_movement(dir_x)
    unless dir_x.zero?
      @position_x -= 1 if dir_x.negative? && valid_movement(@position_x - 1, @position_y)
      @position_x += 1 if dir_x.positive? && valid_movement(@position_x + 1, @position_y)
    end
  end

  def y_movement(dir_y)
    unless dir_y.zero?
      @position_y -= 1 if dir_y.negative? && valid_movement(@position_x, @position_y - 1)
      @position_y += 1 if dir_y.positive? && valid_movement(@position_x, @position_y + 1)
    end
  end

  def valid_movement(position_x, position_y)
    !(%i[vertical horizontal].include? @grid[position_x][position_y])
  end
end
