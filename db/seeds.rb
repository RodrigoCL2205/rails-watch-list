# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Colhendo dados da API. Iniciando...'
url = 'https://tmdb.lewagon.com/movie/top_rated'
json = URI.open(url).read
hash = JSON.parse(json)
puts 'Término. Dados coletados.'

puts 'Início de limpeza do DB'
Movie.destroy_all
puts 'Fim da limpeza do DB'

puts 'início da importação dos filmes ao banco de dados'
hash['results'].each do |result|
  movie = Movie.create!(
    title: result['title'],
    overview: result['overview'],
    poster_url: "https://image.tmdb.org/t/p/original/#{result['poster_path']}",
    rating: result['vote_average']
  )

  puts "Foi importado o filme #{movie.id}."
end
