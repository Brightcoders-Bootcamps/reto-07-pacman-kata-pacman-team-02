require_relative '../bin/maze'

describe Maze do
  describe 'Create bordered board' do
    it 'fills array with vertical border tag' do
      @final_maze = Grid.new(20, 11).generate_maze
      expect(@final_maze[0][0]).to eq(:vertical_border)
    end
  end

  describe 'Create bordered board' do
    it 'fills array with horizontal border tag' do
      @final_maze = Grid.new(20, 11).generate_maze
      expect(@final_maze[0][11]).to eq(:horizontal_border)
    end
  end
end
