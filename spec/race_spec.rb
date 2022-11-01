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

  describe '#register_candidate!' do
    it 'assigns candidate instance to collection' do
      candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})

      expect(@race1.candidates).to eq([candidate1])
    end

    it 'can assign multiple candidates' do
      candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})

      expect(@race1.candidates).to eq([candidate1, candidate2])
    end
  end
end