class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    @title = title
    @@all << self
  end

  def self.all
  	@@all  	
  end

  def self.find_by_title(title)
  	all.detect{|movie| movie.title.downcase == title.downcase}
  end

  def ratings
  	Rating.all.select{|rating| rating.movie == self}
  end

  def viewers
  	ratings.map{|rating| rating.viewer}
  end

  def average_rating
  	(ratings.inject(0){|sum, rating| sum + rating.score}.to_f / ratings.length).round(2)
  end

end
