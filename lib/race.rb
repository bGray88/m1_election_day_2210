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
end
