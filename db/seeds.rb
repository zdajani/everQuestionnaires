# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Questionnaire.create([{title: 'Harry Potter Trivia'}, {title: 'Name The Movie'}])

questionnaire = Questionnaire.create(title: 'Cat breeds')
questionnaire.questions.create([
  { name: "Ragdoll traits",
  label: "name ragdoll trails" },
  { name: "Persian traits",
  label: "name persian trails" }
])