# frozen_string_literal: true

# This contains ghost behaivour
class Ghosts
  attr_reader :position_x, :position_y, :grid

  def initialize(position_x, position_y, grid)
    @position_x = position_x
    @position_y = position_y
    @grid = grid
    grid[position_x][position_y] = 8
  end

  def intelligent_move(pacman_position_x, pacman_position_y, previous_state)
    dir_x = pacman_position_x - @position_x
    dir_y = pacman_position_y - @position_y
    prev_position_x = @position_x
    prev_position_y = @position_y

    x_movement(dir_x)
    y_movement(dir_y)

    state = grid[@position_x][@position_y]
    if pacman_position_x == @position_x && pacman_position_y == @position_y
      state = :gameover
    end
    move_ghost(prev_position_x, prev_position_y, previous_state)

    state
   end

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
      !([:vertical, :horizontal].include? @grid[position_x][position_y])
    end
end
