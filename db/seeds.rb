# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')

# Users
michael = User.create!(
  username: 'Michael',
  password: "123456"
)

olga = User.create!(
  username: 'Olga',
  password: "123456"
)

peter = User.create!(
  username: 'Peter',
  password: "123456"
)