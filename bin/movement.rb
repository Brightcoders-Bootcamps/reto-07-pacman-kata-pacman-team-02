# frozen_string_literal: true

# This class is to pacman can move

class PacmanMovement
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
end
