require 'rspec'
require './lib/candidate'
require './lib/race'

describe Race do
  before(:each) do
    @race1 = Race.new("Texas Governor")
  end

  describe '#initialization' do
    it 'exists' do
      expect(@race1).to be_instance_of(Race)
    end

    it 'does not have candidates upon creation' do
      expect(@race1.candidates).to eq([])
    end
  end
end