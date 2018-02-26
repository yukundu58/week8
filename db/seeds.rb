require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Movie.delete_all
Director.delete_all
Actor.delete_all
Character.delete_all

directors = ["Ron Howard", "Paul Greengrass", "Rian Johnson", "Robert Zemeckis",
              "James Gunn", "Colin Trevorrow", "Bennett Miller",
              "Steven Spielberg", "J.J. Abrams", "Clint Eastwood"]

directors.each do |director|
  Director.create name: director
end

director_data = {"Captain Phillips" => "Paul Greengrass",
"Jurassic Park" => "Steven Spielberg",
"Star Trek" => "J.J. Abrams",
"Star Wars: The Last Jedi" => "Rian Johnson",
"Moneyball" => "Bennett Miller",
"Lincoln" => "Steven Spielberg",
"Sully" => "Clint Eastwood",
"Raiders of the Lost Ark" => "Steven Spielberg",
"Star Wars: The Force Awakens" => "J.J. Abrams",
"Apollo 13" => "Ron Howard",
"Cast Away" => "Robert Zemeckis",
"Guardians of the Galaxy" => "James Gunn"}

movies = eval(File.read("db/movies.rb"))
cast = eval(File.read("db/cast.rb"))

movies.each do |movie_data|
  movie = Movie.new
  movie.imdb_key = movie_data["imdb_key"]
  movie.title = movie_data["title"]
  movie.plot = movie_data["plot"]
  movie.runtime = movie_data["runtime"]
  movie.year = movie_data["year"]
  movie.mpaa = movie_data["mpaa"]
  movie.poster_url = movie_data["poster_url"]
  movie.director = Director.find_by(name: director_data[movie.title])
  if movie.director == nil
    movie.director = Director.first
  end

  movie.save

  # Find/create actors for this movie
  roles = cast[movie.title] || []
  roles.each do |role|
    actor = Actor.find_by(name: role['name'])
    actor ||= Actor.create(name: role['name'], photo_url: role['photo_url'])
    Character.create name: role['character'], movie_id: movie.id, actor_id: actor.id
  end
end

User.delete_all
User.create email: 'cookie@example.org', password: 'monster'
User.create email: 'kermit@example.org', password: 'thefrog'
User.create email: 'fozzy@example.org', password: 'bear'

print "There are now #{Movie.count} movies in the database.\n"
print "There are now #{Director.count} directors in the database.\n"
print "There are now #{Actor.count} actors in the database.\n"
print "There are now #{User.count} users in the database.\n"
