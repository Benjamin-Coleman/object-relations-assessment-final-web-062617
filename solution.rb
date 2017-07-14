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


class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  # I'm certain I overthought the name stuff but I entered some dummmy data that made me
  # realize any non "first_name last_name" input makes things weird

  def initialize(name)
    @name = name
    @first_name = name.split[0]
    @last_name = name.split[-1]
    @@all << self
  end

  def full_name
  	# if name is 2 word string join it, otherwise just use whatever you have for 1 name people or 2+
  	@name.split.length != 2 ? @name : "#{first_name} #{last_name}"
  end

  def self.all
  	@@all
  end

  def self.find_by_name(name)
  	self.all.detect {|viewer| viewer.full_name.downcase == name.downcase}
  end

  def create_rating(score, movie)
  		# use commented code below if we're always passing in a movie object, current code uses string
  		# rating = Rating.new(score, movie, self)
  		Movie.find_by_title(movie) ? Rating.new(score, movie, self) : Rating.new(score, Movie.new(movie), self)
  end

end
