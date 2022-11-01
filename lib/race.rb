require './lib/candidate'

class Race

  attr_reader :office,
              :candidates

  def initialize(office)
    @office     = office
    @candidates = []
    @open = true
  end

  def register_candidate!(candidate)
    candidate = Candidate.new(candidate)
    @candidates.push(candidate)
    candidate
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    return false if @open
    @candidates.max_by {|cand| cand.votes}
  end

  def tie?
    return false if @open
    high_votes = @candidates.max_by {|cand| cand.votes}
    @candidates.count {|cand| cand.votes == high_votes.votes} > 1
  end
end
