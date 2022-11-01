require 'rspec'
require './lib/candidate'
require './lib/race'

describe Race do
  before(:each) do
    @race1 = Race.new("Texas Governor")
    @candidate1 = Candidate.new({name: "Diana D", party: :democrat})
    @candidate2 = Candidate.new({name: "Roberto R", party: :republican})
  end

  describe '#initialization' do
    it 'exists' do
      expect(@race1).to be_instance_of(Race)
    end

    it 'does not have candidates upon creation' do
      expect(@race1.candidates).to eq([])
    end
  end

  describe '#register_candidate!' do
    it 'assigns candidate instance to collection' do
      @race1.register_candidate!(@candidate1)

      expect(@race1.candidates).to eq([@candidate1])
    end

    it 'can assign multiple candidates' do
      @race1.register_candidate!(@candidate1)
      @race1.register_candidate!(@candidate2)

      expect(@race1.candidates).to eq([@candidate1, @candidate2])
    end
  end
end