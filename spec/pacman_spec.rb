require File.join(File.dirname(__FILE__), '../bin/app')
require File.join(File.dirname(__FILE__), '../bin/pacman')

describe PacmanExists do

  describe "Pacman" do
    it "Pacman is in the game" do
      @pacman = Pacman.new
    expect Pacman.new(7, 9, 1)
    end
  end
end