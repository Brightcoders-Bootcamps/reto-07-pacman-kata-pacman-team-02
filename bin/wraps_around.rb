class WrapsAround
  attr_reader :position_x, :position_y

  def wraps_around(current_position, prev_x, prev_y, grid, score)
    score = change_score(prev_x, prev_y, grid, score)
    @position_x = grid.length - 2 if current_position == :horizontal_border && direction == :UP
    @position_x = 1 if current_position == :horizontal_border && direction == :DOWN
    @position_y = 1 if current_position == :vertical_border && direction == :RIGHT
    @position_y = grid[0].length - 2 if current_position == :vertical_border && direction == :LEFT
    grid[@position_x][@position_y] = :pacman
    score
  end

  def change_score(prev_x, prev_y, grid, score)
    score += 1 if grid[@position_x][@position_y] == :food
    grid[prev_x][prev_y] = :empty
    score
  end
end
