require 'rspec'
require './lib/candidate'
require './lib/race'
require './lib/election'

describe Election do
  before(:each) do
    @election = Election.new
    @race1 = Race.new("Texas Governor")
    @candidate1 = Candidate.new({name: "Diana D", party: :democrat})
    @candidate2 = Candidate.new({name: "Roberto R", party: :republican})
  end

  describe '#initialization' do
    it 'exists' do
      expect(@election).to be_instance_of(Election)
    end
  end
end