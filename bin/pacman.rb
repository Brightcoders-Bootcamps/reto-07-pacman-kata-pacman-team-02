# frozen_string_literal: true

class Pacman
  attr_reader :position_x, :position_y, :direction

  MINI = {
    TOP: 'u',
    RIGHT: 'c',
    DOWN: 'n',
    LEFT: 'ͻ'
  }.freeze

  BIG = {
    UP: 'Ս',
    RIGHT: 'C',
    DOWN: 'Ո',
    LEFT: 'Ɔ'
  }.freeze

  def initialize(position_x, position_y, direction)
    @position_x = position_x
    @position_y = position_y
    @direction = direction
  end
end
