# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Story.create(name: "Story One")

Message.create(content: "The story starts", order: 1, story_id: 1)
Message.create(content: "Someone goes missing", order: 2, story_id: 1)
Message.create(content: "The end", order: 3, story_id: 1)
