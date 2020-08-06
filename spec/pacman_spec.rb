require_relative '../bin/pacman'

describe Pacman do
  describe 'Pacman exists' do
    it 'Pacman is in the game' do
      @pacman = Pacman.new(7, 9, :LEFT)
      expect(@pacman.position_x).to eq(7)
      expect(@pacman.position_y).to eq(9)
      expect(@pacman.direction).to eq(:LEFT)
    end
  end

  describe 'Pacman MINI' do
    it 'Pacman is mini' do
      expect(Pacman::MINI[:LEFT]).to eq(' ͻ ')
      expect(Pacman::MINI[:RIGHT]).to eq(' c ')
      expect(Pacman::MINI[:UP]).to eq(' u ')
      expect(Pacman::MINI[:DOWN]).to eq(' n ')
    end
  end

  describe 'Pacman BIG' do
    it 'Pacman is big' do
      expect(Pacman::BIG[:LEFT]).to eq(' Ɔ ')
      expect(Pacman::BIG[:RIGHT]).to eq(' C ')
      expect(Pacman::BIG[:UP]).to eq(' Ս ')
      expect(Pacman::BIG[:DOWN]).to eq(' Ո ')
    end
  end
end
