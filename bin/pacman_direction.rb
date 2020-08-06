class PacmanDirection
  def pacman_direction(direction, grid)
    @position_x -= 1 if direction == :UP && valid_movement(@position_x - 1, @position_y, grid)
    @position_y += 1 if direction == :RIGHT && valid_movement(@position_x, @position_y + 1, grid)
    @position_x += 1 if direction == :DOWN && valid_movement(@position_x + 1, @position_y, grid)
    @position_y -= 1 if direction == :LEFT && valid_movement(@position_x, @position_y - 1, grid)
  end
end
