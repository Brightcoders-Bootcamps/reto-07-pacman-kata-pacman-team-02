
require_relative 'maze_level_two'
require_relative 'maze_level_one'

class MazeLevels
  def generate_maze
    laberinto = MazeLevelOne.new(@grid)
    laberinto.create_maze(@width - 1, @height - 1)
  end

  def generate_maze_level_two
    laberinto = MazeLevelTwo.new(@grid)
    laberinto.create_maze(@width - 1, @height - 1)
  end
end
