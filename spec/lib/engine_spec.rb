require './lib/engine'

RSpec.describe do

  before(:each) do
    @engine = Engine.new
  end

  describe '#initialize' do

    it 'should have neutral starting x coord' do
      expect(@engine.x).to eql 0
    end

    it 'should have neutral starting y coord' do
      expect(@engine.y).to eql 0
    end

  end

  describe '#report' do
    context 'new engine instance' do
      it 'should return a default co-ords facing north' do
        expect(@engine.command("REPORT")).to eql "Output: 0, 0, NORTH"
      end
    end
  end

  describe '#place' do
    it 'places the robot in the correct place' do
      @engine.command('PLACE 2,3,WEST')
      expect(@engine.x).to eql 2
      expect(@engine.y).to eql 3
      expect(@engine.orientation).to eql 'WEST'
    end
  end

  describe '#move' do
    it 'moves forward one step' do
      @engine.command('MOVE')
      expect(@engine.y).to eql 1
      expect(@engine.x).to eql 0
    end
  end

end
