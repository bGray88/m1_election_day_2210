class Election

  attr_reader :year,
              :races

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races.push(race)
  end

  def candidates
    @races.map {|race| race.candidates}.flatten
  end

  def vote_counts
    counts = {}
    candidates.each {|cand| counts[cand.name] = cand.votes}
    counts
  end
end
