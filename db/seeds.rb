# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Story.create(name: "Story One", id: 1)

Story.create(name: "Branch One", id: 2)
Story.create(name: "Branch Two", id: 3)

Message.create(content: "The story starts. Continue? 'Y' or 'N'", order: 1, story_id: 1)
Message.create(content: "Someone goes missing. Continue? 'Y' or 'N'", order: 2, story_id: 1)

Message.create(content: "Call the emergency services and ask for help? 'A' for yes 'B' for no", order: 3, story_id: 1, branches_to_one: 2, branches_to_two: 3, branches: true)

Message.create(content: "They where found. Continue? 'Y' or 'N'", order: 1, story_id: 2)
Message.create(content: "The end", order: 2, story_id: 2)

Message.create(content: "They where NEVER found. Continue? 'Y' or 'N'", order: 1, story_id: 3)
Message.create(content: "The end", order: 2, story_id: 3)
