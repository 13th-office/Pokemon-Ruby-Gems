# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user =  Trainer.create(name: "User")
emilio =  Trainer.create(name: "Emilio")
gael =  Trainer.create(name: "Gael")
juanpi =  Trainer.create(name: "Juanpi")
alyps =  Trainer.create(name: "Alyps")
aleps =  Trainer.create(name: "Aleps")

user.save
emilio.save
juanpi.save
alyps.save
aleps.save

bulbasaur = PokeApi.get(pokemon: "bulbasaur")
pikachu = PokeApi.get(pokemon: "pikachu")

bulba = Pokemon.create(p_id: bulbasaur.order, name: bulbasaur.name)
pika = Pokemon.create(p_id: pikachu.order, name: pikachu.name)

bulba.save
pika.save

emilio = Trainer.find_by(name: "Emilio")
gael = Trainer.find_by(name: "Gael")

emilio_owns = OwnsPokemon.create(pokemon_id: bulba.id, trainer_id: emilio.id)
gael_owns = OwnsPokemon.create(pokemon_id: pika.id, trainer_id: gael.id)

emilio_owns.save
gael_owns.save