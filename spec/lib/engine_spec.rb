require './lib/engine'
require 'faker'

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

  describe 'invalid commands' do
    it 'Random words fail' do
      expect {
        @engine.command(Faker::Lorem.word)
      }.to raise_error(RuntimeError, 'Invalid Command Entered')
    end
  end

  describe '#move' do
    it 'moves forward one step' do
      @engine.command('MOVE')
      expect(@engine.y).to eql 1
      expect(@engine.x).to eql 0
    end
  end

  describe '#left' do
    it 'rotates left from South' do
      @engine.command('LEFT')
      expect(@engine.orientation).to eql 'WEST'
    end

    it 'rotates left from West' do
      @engine.command('PLACE 2,3,WEST')
      @engine.command('LEFT')
      expect(@engine.orientation).to eql 'SOUTH'
    end

  end

  describe '#right' do
    it 'rotates right from North' do
      @engine.command('RIGHT')
      expect(@engine.orientation).to eql 'EAST'
    end

    it 'rotates right from East' do
      @engine.command('PLACE 2,3,EAST')
      @engine.command('RIGHT')
      expect(@engine.orientation).to eql 'SOUTH'
    end

  end

  describe '#report' do
    context 'new engine instance' do
      it 'should return a default co-ords facing north' do
        expect(@engine.command("REPORT")).to eql "Output: 0,0,NORTH"
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

    it 'places the robot in the correct place and returns the correct vals' do
      expect(@engine.command('PLACE 2,3,WEST')).to eql([2, 3, 'WEST'])
    end

    it 'cannot place the robot more than once' do
      @engine.command('PLACE 2,3,WEST')
      expect {
        @engine.command('PLACE 2,3,WEST')
      }.to raise_error(RuntimeError, 'Cannot Place Robot Toy More than Once')
    end

    context 'invalid bounds' do
      it 'x coord is too low' do
        expect {
          @engine.command('PLACE -1,0,NORTH')
        }.to raise_error(RuntimeError, 'Cannot Place Robot Toy Robot Outside of the Board\'s Boundaries')
      end
      it 'x coord is too high' do
        expect {
          @engine.command('PLACE 5,0,NORTH')
        }.to raise_error(RuntimeError, 'Cannot Place Robot Toy Robot Outside of the Board\'s Boundaries')
      end
      it 'x coord is too low' do
        expect {
          @engine.command('PLACE 0,-1,NORTH')
        }.to raise_error(RuntimeError, 'Cannot Place Robot Toy Robot Outside of the Board\'s Boundaries')
      end
      it 'y coord is too high' do
        expect {
          @engine.command('PLACE 0,5,NORTH')
        }.to raise_error(RuntimeError, 'Cannot Place Robot Toy Robot Outside of the Board\'s Boundaries')
      end
    end
  end


end
