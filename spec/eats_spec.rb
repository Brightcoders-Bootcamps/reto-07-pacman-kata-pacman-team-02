require_relative '../bin/eats'
require_relative '../bin/grid'

describe Eats do
  describe 'Pacman eats left food' do
    it 'Eats food' do
      @pacman = Pacman.new(1, 5, :LEFT)
      @final_maze = Grid.new(20, 11).generate_maze
      expect(@pacman.move(:LEFT, @final_maze, 0)).to eq(1)
    end
  end

  describe 'Pacman eats right food' do
    it 'Eats food' do
      @pacman = Pacman.new(2, 3, :RIGHT)
      @final_maze = Grid.new(20, 11).generate_maze
      expect(@pacman.move(:RIGHT, @final_maze, 0)).to eq(1)
    end
  end

  describe 'Pacman eats up food' do
    it 'Eats food' do
      @pacman = Pacman.new(2, 3, :UP)
      @final_maze = Grid.new(20, 11).generate_maze
      expect(@pacman.move(:UP, @final_maze, 0)).to eq(1)
    end
  end

  describe 'Pacman eats down food' do
    it 'Eats food' do
      @pacman = Pacman.new(2, 3, :DOWN)
      @final_maze = Grid.new(20, 11).generate_maze
      expect(@pacman.move(:DOWN, @final_maze, 0)).to eq(1)
    end
  end
end
