require 'rspec'
require './lib/candidate'
require './lib/race'
require './lib/election'

describe Election do
  before(:each) do
    @election = Election.new('2022')
    @race1 = Race.new("Virginia District 4 Representative")
    @race2 = Race.new("Texas Governor")
  end

  describe '#initialization' do
    it 'exists' do
      expect(@election).to be_instance_of(Election)
    end

    it 'has a year when initialized' do
      expect(@election.year).to eq('2022')
    end

    it 'has no race upon creation' do
      expect(@election.races).to eq([])
    end
  end

  describe '#add_race' do
    it 'adds races to the election collection' do
      @election.add_race(@race1)
      @election.add_race(@race2)

      expect(@election.races).to eq([@race1, @race2])
    end
  end
end