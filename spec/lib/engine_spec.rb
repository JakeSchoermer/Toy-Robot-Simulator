require './lib/engine'

RSpec.describe do

  describe '#initialize' do

    before(:each) do
      @engine = Engine.new
    end

    it 'should have neutral starting x coord' do
      expect(@engine.x).to eql 0
    end

    it 'should have neutral starting y coord' do
      expect(@engine.y).to eql 0
    end

  end

end
