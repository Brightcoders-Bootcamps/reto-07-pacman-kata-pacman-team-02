# frozen_string_literal: true

# This is the class to create a grid to the game
class Grid

    # def initialize(size)
    #   @size = size
    #   @grid = Array.new(size) { Array.new(size) {rand(0..0)} }
    #   @middle = (size/2).floor()
    # end

    def initialize(width, height)
      @width = width
      @height = height
      @grid = Array.new(height) { Array.new(width) {rand(0..0)} }
    end

    def iterate_grid
      for row in 0..(@height - 1 )
        for column in 0..(@width - 1)
          print "\t."
        end
        puts
      end
    end

    # def iterate_grid
    #   for row in 0..(@size - 1 )
    #     for column in 0..(@size - 1)
    #       print row == @middle && column == @middle ?  'v' : '.'
    #     end
    #     puts
    #   end
    # end
end

new_grid = Grid.new(15, 11) 
new_grid.iterate_grid
