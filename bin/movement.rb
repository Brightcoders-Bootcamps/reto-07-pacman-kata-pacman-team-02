class Movement
  
   def x_position(dir_x)
    unless dir_x.zero?
      @position_x -= 1 if dir_x.negative? && valid_position(@position_x - 1, @position_y)
      @position_x += 1 if dir_x.positive? && valid_position(@position_x + 1, @position_y)
    end
   end

   def y_position(dir_y)
    unless dir_y.zero?
      @position_y -= 1 if dir_y.negative? && valid_position(@position_x, @position_y - 1)
      @position_y += 1 if dir_y.positive? && valid_position(@position_x, @position_y + 1)
    end
    end

    def valid_position(position_x, position_y)
      !([:vertical, :horizontal].include? @grid[position_x][position_y])
    end

end
