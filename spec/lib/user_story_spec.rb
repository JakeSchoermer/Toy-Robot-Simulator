# Testing the user storys for this app (provided by Genie)

require './lib/engine'

RSpec.describe do

  before(:each) do
    @engine = Engine.new
  end

  describe 'Story 1' do
    before do
      @engine.command('PLACE 0,0,NORTH')
      @engine.command('MOVE')
    end

    it 'reports the correct location' do
      expect(@engine.command('REPORT')).to eql 'Output: 0,1,NORTH'
    end

    it 'the engine object reports the correct x coord' do
      expect(@engine.x).to eql 0
    end

    it 'the engine object reports the correct y coord' do
      expect(@engine.y).to eql 1
    end

    it 'the engine object reports the correct orientation' do
      expect(@engine.orientation).to eql 'NORTH'
    end

  end
end