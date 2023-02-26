require 'open-uri'
require  'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
puts 'Cleaning DB...'
Movie.destroy_all
puts 'DB cleaned!'
url = 'https://tmdb.lewagon.com/movie/top_rated'
reader = URI.open(url).read
result = JSON.parse(reader)['results']
result.each do |movie|
  puts 'Creating movie...'
  base_url_poster = 'https://image.tmdb.org/t/p/original'
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    rating: movie['vote_average'],
    poster_url: "#{base_url_poster}#{movie['poster_path']}"
  )
end
puts 'Movies created!'
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
