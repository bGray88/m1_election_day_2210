class Election

  attr_reader :year
  
  def initialize(year)
    @year = year
    @races = []
  end
end
