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

  describe '#vote_counts' do
    it 'keeps a tally of votes' do
      @election.add_race(@race1)
      @election.add_race(@race2)

      candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})
      candidate3 = @race2.register_candidate!({name: "Diego D", party: :democrat})
      candidate4 = @race2.register_candidate!({name: "Rita R", party: :republican})
      candidate5 = @race2.register_candidate!({name: "Ida I", party: :independent})

      4.times {candidate1.vote_for!}
      1.times {candidate2.vote_for!}
      10.times {candidate3.vote_for!}
      6.times {candidate4.vote_for!}
      6.times {candidate5.vote_for!}

      expect(@election.vote_counts).to eq({"Diana D"=>4, 
                                           "Roberto R"=>1, 
                                           "Diego D"=>10, 
                                           "Rita R"=>6, 
                                           "Ida I"=>6})
    end
  end

  describe '#winners' do
    it 'returns collection of winners from each race' do
      @election.add_race(@race1)
      @election.add_race(@race2)

      candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})
      candidate3 = @race2.register_candidate!({name: "Diego D", party: :democrat})
      candidate4 = @race2.register_candidate!({name: "Rita R", party: :republican})
      candidate5 = @race2.register_candidate!({name: "Ida I", party: :independent})

      4.times {candidate1.vote_for!}
      1.times {candidate2.vote_for!}
      10.times {candidate3.vote_for!}
      6.times {candidate4.vote_for!}
      6.times {candidate5.vote_for!}

      @race1.close!
      @race2.close!

      expect(@election.winners).to eq([candidate1, candidate3])

      4.times {candidate4.vote_for!}

      expect(@election.winners).to eq([candidate1])
    end
  end
end