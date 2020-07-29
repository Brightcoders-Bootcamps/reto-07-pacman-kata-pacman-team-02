# frozen_string_literal: true

class Laberinto

  def initialize(grid)
    @grid = grid
  end

      def generate_maze
        set_horizontal_wall([2, 8], [2, 3, -3, -4])
        set_horizontal_wall([4, 6], [4, 5, -5, -6])
        set_vertical_wall([3, 4, -4, -5], [2, -3])
        set_vertical_wall([1, 2, -2, -3], [5, -6])
      end

      def set_horizontal_wall(rows, columns)
        rows.each do |row|
          columns.each do |column|
            @grid[row][column] = 2
          end
        end
        rows.each do |row|
          (7..12).step(1) do |position|
            @grid[row][position] = 2
          end
        end
      end

      def set_vertical_wall(rows, columns)
        columns.each do |current_column|
          rows.each do |row|
            @grid[row][current_column] = 1
          end
        end
      end
end
