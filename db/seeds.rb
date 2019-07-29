# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def characters
  JSON.parse(SwapiService.perform('people')).with_indifferent_access
end

def films
  JSON.parse(SwapiService.perform('films')).with_indifferent_access
end

def planets
  JSON.parse(SwapiService.perform('planets')).with_indifferent_access
end

def starships
  JSON.parse(SwapiService.perform('starships')).with_indifferent_access
end

def vehicles
  JSON.parse(SwapiService.perform('vehicles')).with_indifferent_access
end

def species
  JSON.parse(SwapiService.perform('species')).with_indifferent_access
end

def generate_model(json, entity)
  model = eval(entity.singularize.capitalize)

  json.each { |object| puts "Created #{object[:name]}" if model.send(:create, name: object[:name]) }
end

def associate_to_film(film, new_film, entity)
  film[entity].each do |url|
    id = url.split('/').last.to_i
    model = eval(entity.singularize.capitalize)
    model_entity = model.send(:where, id: id)

    unless model_entity.empty?
      puts entity
      new_film.send("#{entity}") << model_entity.first
    end
  end
end

models = %w[characters planets starships vehicles species]
excluded_attributes = %w[created edited url]

models.each do |entity|
  json = method(entity).call

  generate_model(json[:results], entity)
end

films[:results].each do |film|
  new_film = Film.new

  film.each do |key, value|
    next if (models + excluded_attributes).include? key

    new_film.send("#{key}=", value)
  end
  puts new_film.title if new_film.save

  models.each do |model|
    associate_to_film(film, new_film, model)
  end
end

