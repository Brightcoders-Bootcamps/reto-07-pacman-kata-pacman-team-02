class Pacman
  attr_reader :position_x, :position_y, :direction

  def initialize(position_x, position_y, direction)
    @position_x = position_x
    @position_y = position_y
    @direction = direction
  end

  def move(direction, grid, score)
    @direction = direction
    prev_x = @position_x
    prev_y = @position_y
    if direction == 1 && (grid[@position_x - 1][@position_y] != :horizontal && grid[@position_x - 1][@position_y] != :vertical)
      @position_x -= 1
      end  # Arriba
    if direction == 2 && (grid[@position_x][@position_y + 1] != :horizontal && grid[@position_x][@position_y + 1] != :vertical)
      @position_y += 1
      end  # Derecha
    if direction == 3 && (grid[@position_x + 1][@position_y] != :horizontal && grid[@position_x + 1][@position_y] != :vertical)
      @position_x += 1
      end  # Abajo
    if direction == 4 && (grid[@position_x][@position_y - 1] != :horizontal && grid[@position_x][@position_y - 1] != :vertical)
      @position_y -= 1
      end  # Izquierda
    eats(prev_x, prev_y, grid, direction, score)
  end

  def eats(prev_x, prev_y, grid, direction, score)
    if grid[prev_x][prev_y] == grid[@position_x][@position_y]
      grid[@position_x][@position_y] = 7
    elsif grid[@position_x][@position_y] == 3 && direction == 1
      grid[prev_x][prev_y] = 6
      score += 1 if grid[@position_x][@position_y] == 0
      @position_x = grid.length - 2
      grid[@position_x][@position_y] = 7
    elsif grid[@position_x][@position_y] == 3 && direction == 3
      score += 1 if grid[@position_x][@position_y] == 0
      grid[prev_x][prev_y] = 6
      @position_x = 1
      grid[@position_x][@position_y] = 7
    elsif grid[@position_x][@position_y] == 4 && direction == 2
      score += 1 if grid[@position_x][@position_y] == 0
      grid[prev_x][prev_y] = 6
      @position_y = 1
      grid[@position_x][@position_y] = 7
    elsif grid[@position_x][@position_y] == 4 && direction == 4
      score += 1 if grid[@position_x][@position_y] == 0
      grid[prev_x][prev_y] = 6
      @position_y = grid[0].length - 2
      grid[@position_x][@position_y] = 7
    else
      score += 1 if grid[@position_x][@position_y] == 0
      grid[@position_x][@position_y] = 7
      grid[prev_x][prev_y] = 6
    end
    score
  end
  end
