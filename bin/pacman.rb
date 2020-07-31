class Pacman
    attr_reader :position_x, :position_y, :direction
  
    def initialize(position_x, position_y, direction)
      @position_x = position_x
      @position_y = position_y
      @direction = direction
    end
  
    def move(direction, grid)
      @direction = direction
      prev_x = @position_x
      prev_y = @position_y
      @position_x -= 1 if direction == 1 && (grid[@position_x - 1][@position_y] != 2 && grid[@position_x - 1][@position_y] != 1)  # Arriba
      @position_y += 1 if direction == 2 && (grid[@position_x][@position_y + 1] != 2 && grid[@position_x][@position_y + 1] != 1)  # Derecha
      @position_x += 1 if direction == 3 && (grid[@position_x + 1][@position_y] != 2 && grid[@position_x + 1][@position_y] != 1)  # Abajo
      @position_y -= 1 if direction == 4 && (grid[@position_x][@position_y - 1] != 2 && grid[@position_x][@position_y - 1] != 1)  # Izquierda
     
      eats(prev_x, prev_y, grid, direction)
    end

    def eats(prev_x, prev_y, grid, direction)
      
      if grid[prev_x][prev_y] == grid[@position_x][@position_y] 
        grid[@position_x][@position_y] = 7
      elsif grid[@position_x][@position_y] == 3 && direction == 1
        grid[prev_x][prev_y] = 6
        @position_x = grid.length - 2
        grid[@position_x][@position_y] = 7
      elsif grid[@position_x][@position_y] == 3 && direction == 3
        grid[prev_x][prev_y] = 6
        @position_x = 1
        grid[@position_x][@position_y] = 7
      elsif grid[@position_x][@position_y] == 4 && direction == 2
        grid[prev_x][prev_y] = 6
        @position_y = 1
        grid[@position_x][@position_y] = 7
      elsif grid[@position_x][@position_y] == 4 && direction == 4
        grid[prev_x][prev_y] = 6
        @position_y = grid[0].length - 2
        grid[@position_x][@position_y] = 7
      else 
        grid[@position_x][@position_y] = 7
        grid[prev_x][prev_y] = 6
      end
    end
  end
