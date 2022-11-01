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
    @races.map {||}
  end

  def vote_counts
    @races.map {|race| p race}
  end
end
