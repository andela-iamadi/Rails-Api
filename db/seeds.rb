# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

S1 = Session.create(name: "Morning Session", start_time: "555", end_time: "600")
S2 = Session.create(name: "Afternoon Session", start_time: "955", end_time: "1000")

	D11 = Day.create(theme: "Creative Learning", session_day: '432223311001')
	D21 = Day.create(theme: "Being in the moment", session_day: '132223311001')
	D31 = Day.create(theme: "Yes, and", session_day: '22113311001')
	D41 = Day.create(theme: "Learning and sharing", session_day: '10022311001')

	D11.sessions << [S1, S2]
	D21.sessions << [S1, S2]
	D31.sessions << [S1, S2]
	D41.sessions << [S1, S2]

	F1 = Fellow.create(first_name: "Cent", last_name: "Amadi", email: "tru2cent@gmail.com", session_id: S1)
	F2 = Fellow.create(first_name: "Olatoyosi", last_name: "Famakinde", email: "olatoyosi@gmail.com", session_id: S1)
	F3 = Fellow.create(first_name: "Daisi", last_name: "Sowemimo", email: "daisi.sowemimo@gmail.com", session_id: S1)

	User.create([
		{ username: "cent", password: "cent", role: "Admin", fellow_id: F1 },
		{ username: "toyosi", password: "toyosi", role: "Fellow", fellow_id: F2 },
		{ username: "daisi", password: "daisi", role: "Fellow", fellow_id: F3 }
	])
