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
    all_cands = @candidates.map {|cand| cand.votes}.length
    rm_dups = @candidates.map {|cand| cand.votes}.uniq.length
    all_cands > rm_dups
  end
end
