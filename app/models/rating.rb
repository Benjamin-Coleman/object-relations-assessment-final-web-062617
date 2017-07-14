class Rating
  attr_accessor :score, :movie, :viewer

  @@all = []

  def initialize(score, movie, viewer)
  	@score = score
  	@movie = movie
  	@viewer = viewer
  	@@all << self
  end

  def self.all
  	@@all
  end

end
