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
  end
end