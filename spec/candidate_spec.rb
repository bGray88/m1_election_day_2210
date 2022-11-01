require 'rspec'
require './lib/candidate'

describe Candidate do
  before(:each) do
    @candidate1 = Candidate.new({name: "Diana D", party: :democrat})
  end

  describe '#initialization' do
    it 'exists' do
      expect(@candidate1).to be_instance_of(Candidate)
    end

    it 'creates attributes upon creation' do
      expect(@candidate1.name).to eq("Diana D")
      expect(@candidate1.party).to eq(:democrat)
      expect(@candidate1.votes).to eq(0)
    end
  end

  describe '#vote_for!' do
    it 'increments votes once per call' do
      @candidate1.vote_for!
      @candidate1.vote_for!
      @candidate1.vote_for!
      @candidate1.vote_for!

      expect(@candidate1.votes).to eq(4)
    end
  end
end