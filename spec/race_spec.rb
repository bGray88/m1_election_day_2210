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

  describe '#open?' do
    it 'indicates whether the race is open by boolean' do
      expect(@race1.open?).to eq(true)
    end
  end

  describe '#close!' do
    it 'changes the open state to false' do
      @race1.close!
      expect(@race1.open?).to eq(false)
    end
  end

  describe '#winner' do
    it 'checks for closed and returns current highest votes holder' do
      expect(@race1.winner).to eq(false)

      candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})

      4.times {candidate1.vote_for!}
      10.times {candidate2.vote_for!}

      @race1.close!

      expect(@race1.winner).to eq(candidate2)
    end
  end

  describe '#tie?' do
    it 'checks for closed and returns current highest votes holder' do
      expect(@race1.winner).to eq(false)

      candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})
      candidate3 = @race1.register_candidate!({name: "Diego D", party: :democrat})
      candidate4 = @race1.register_candidate!({name: "Rita R", party: :republican})
      candidate5 = @race1.register_candidate!({name: "Ida I", party: :independent})

      10.times {candidate1.vote_for!}
      10.times {candidate2.vote_for!}
      4.times {candidate3.vote_for!}
      1.times {candidate4.vote_for!}
      6.times {candidate5.vote_for!}

      @race1.close!

      expect(@race1.tie?).to be true

      candidate1.vote_for!

      expect(@race1.tie?).to be false
    end
  end
end