require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#dummy data

ben = Viewer.new("Ben Coleman")
walle = Movie.new("Walle")
toy_story = Movie.new("Toy Story")
kanye = Viewer.new("Kanye")
chance = Viewer.new("Chance the Rapper")

Pry.start
