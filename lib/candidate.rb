class Candidate

  attr_reader :name,
              :party
  def initialize(candidate)
    @name  = candidate[:name]
    @party = candidate[:party]
  end
end
