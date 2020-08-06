# frozen_string_literal: true

require_relative('movement')

# Pacman class to move pacman
class Pacman < PacmanMovement
  attr_reader :position_x, :position_y, :direction

  MINI = {
    UP: ' u ',
    RIGHT: ' c ',
    DOWN: ' n ',
    LEFT: ' ͻ '
  }.freeze

  BIG = {
    UP: ' Ս ',
    RIGHT: ' C ',
    DOWN: ' Ո ',
    LEFT: ' Ɔ '
  }.freeze

  def initialize(position_x, position_y, direction)
    @position_x = position_x
    @position_y = position_y
    @direction = direction
  end
end
