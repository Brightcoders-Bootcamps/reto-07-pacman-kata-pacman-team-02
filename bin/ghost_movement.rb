require_relative('coord_movement')

class GhostMovement < CoordMovement
  def move_ghost(prev_position_x, prev_position_y, previous_state)
    grid[@position_x][@position_y] = :ghost
    unless prev_position_x == @position_x && prev_position_y == @position_y
      grid[prev_position_x][prev_position_y] = previous_state
    end
  end

  def valid_movement(position_x, position_y)
    !(%i[vertical horizontal].include? @grid[position_x][position_y])
  end
end
