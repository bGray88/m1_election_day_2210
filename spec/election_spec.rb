require 'rspec'
require './lib/candidate'
require './lib/race'
require './lib/election'

describe Election do
  before(:each) do
    @election = Election.new('2022')
    @race1 = Race.new("Texas Governor")
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
end