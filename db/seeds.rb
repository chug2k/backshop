# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

test_words = %w(
  absurd
  beautiful
  cute
  dreary
  egotistical
  failure
  gregarious
  haggard
)

test_words.each {|t| Topic.create(name: t)}