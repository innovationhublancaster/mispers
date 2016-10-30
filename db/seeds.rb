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

Message.create(content: "[NARRATOR]: You will follow the story of Stacey, a 15 year old girl from east London who is talking to a boy she met online called Kev. You will follow the story from Stacey's perspective. Continue Story? 'Y' or 'N'", order: 1, story_id: 1)
Message.create(content: "[NARRATOR]: Kev invites Stacey to a party at his but Stacey was reluctant was relutant to go. Continue Story? 'Y' or 'N'", order: 2, story_id: 1)

Message.create(content: "[KEV 10:00 am]: Hey baby, fancy coming to a party tonight at mine? xxx. Continue Story? 'Y' or 'N'", order: 3, story_id: 1)
Message.create(content: "[YOU 10:01 am]: Hey, I'm not sure, my mum might not let me xxx. Continue Story? 'Y' or 'N'", order: 4, story_id: 1)

Message.create(content: "[NARRATOR]: Over the course of the day, Kev increased the pressure on Stacey. Continue Story? 'Y' or 'N'", order: 5, story_id: 1)
Message.create(content: "[KEV 10:30 am]: Your mum doesnt need to know, lie to her and say your staying at a friends house, come on! xxx. Continue Story? 'Y' or 'N'", order: 6, story_id: 1)

Message.create(content: "[ADVISE]: In this situation, Stacey could tell her mum about the pressure being applied by the online stranger, or talk to the NSPCC helpline annoymously. Continue Story? 'Y' or 'N'", order: 7, story_id: 1)
Message.create(content: "[NARRATOR]: Stacey buckles under the pressure and agrees to go to the party at Kev's house. Continue Story? 'Y' or 'N'", order: 8, story_id: 1)

Message.create(content: "[YOU 11:00 am]: Okay then Kev, I'll come. Where is your house? xxx. Continue Story? 'Y' or 'N'", order: 9, story_id: 1)
Message.create(content: "[NARRATOR]: Stacey tells her mum that she is staying at her friends house, but she goes to meet Kev. A couple of hours later Stacey stops replying to messages. Continue Story? 'Y' or 'N'", order: 10, story_id: 1)

Message.create(content: "[MUM 06:00 pm]: Are you coming home tonight or staying out stacey? x. Continue Story? 'Y' or 'N'", order: 11, story_id: 1)
Message.create(content: "[MUM 08:00 pm]: Stacey please can you reply, i'm getting worried.... Continue Story? 'Y' or 'N'", order: 12, story_id: 1)

Message.create(content: "[NARRATOR]: Stacey discovered Kev is not who he said he was, and is also a lot older, there is no party just the two of them. Continue Story? 'Y' or 'N'", order: 13, story_id: 1)
Message.create(content: "[MUM 10:00 pm]: What is going on, where are you???. Continue Story? 'Y' or 'N'", order: 14, story_id: 1)

Message.create(content: "[NARRATOR]: Kev is making Stacey feel uncomfortable, she wants to leave but is too scared to, Stacey also wont reply to her mum because she is worried about the conciquences of her lie. Continue Story? 'Y' or 'N'", order: 15, story_id: 1)
Message.create(content: "[NARRATOR]: Staceys options could be to call the emergency services if Kevs behaviour became inapropriate, or to call her mother, parents care about your safety and will not be angry if you admit your mistake. 'A' to call for help, 'B' to Continue Story.", order: 16, story_id: 1, branches_to_one: 2, branches_to_two: 3, branches: true)

Message.create(content: "[NARRATOR]: Staceys mum picked her up from Kevs safely. Stacey told her mum everything that had happened, they call the emergency services. Continue Story? 'Y' or 'N'", order: 1, story_id: 2)
Message.create(content: "[NARRATOR]: If you ever find yourself in a similar situation or find yourself too afraid to call or return home, visit ........", order: 2, story_id: 2)

Message.create(content: "[NARRATOR]: Several worried texts arrive from staceys mum. Stacey tries to leave but kev wont let her.... Continue Story? 'Y' or 'N'", order: 1, story_id: 3)
Message.create(content: "[NARRATOR]: Stacey was NEVER found. Continue? 'Y' or 'N'", order: 2, story_id: 3)
