
require_relative 'ghosts'

class UserControl

  DIRECTIONS = {
    'A' => :UP,
    'B' => :DOWN,
    'D' => :LEFT,
    'C' => :RIGHT
  }.freeze

  def start
    @final_grid = @grid.generate_maze
    start_ghosts(@final_grid)

    char = 'D'
    @current_option = 'D'
    prev_value = 6
    loop do
      if prev_value == :gameover
        puts 'Game Over'
        break
      end
      game_state
      user_move(DIRECTIONS[@current_option], @current_option)
      prev_value = @intelliget_ghost.intelligent_move(@pacman.position_x, @pacman.position_y, prev_value)
      prev_value = @intelliget_ghost_two.intelligent_move(@pacman.position_x, @pacman.position_y, prev_value)
      char = user_data
      @current_option = char if char != @current_option && !char.nil?
      sleep(0.5)
    end
  end

  def start_ghosts(grid)
    @intelliget_ghost = Ghosts.new(5, 8, grid)
    @intelliget_ghost_two = Ghosts.new(5, 11, grid)
  end

  def user_move(position, option)
    @score = @pacman.move(position, @final_grid, @score)
    @current_option = option
    print_game
  end

  def game_state
    if @score == 103
      @level = 2
      @grid.generate_maze_level_two
      @score = 0
    end
  end

  def user_data
    system('stty raw -echo')
    char = begin
             STDIN.read_nonblock(1)
           rescue StandardError
             nil
           end
    system('stty -raw echo')
    char
  end
end
