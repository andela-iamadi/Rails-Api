# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

S1 = Session.create(name: "Morning Session", start_time: "555", end_time: "600")
S2 = Session.create(name: "Afternoon Session", start_time: "955", end_time: "1000")

	D11 = Day.create(theme: "Creative Learning", session_day: '432223311001', session_id: S1)
	D21 = Day.create(theme: "Being in the moment", session_day: '132223311001', session_id: S1)
	D31 = Day.create(theme: "Yes, and", session_day: '22113311001', session_id: S1)
	D41 = Day.create(theme: "Learning and sharing", session_day: '10022311001', session_id: S1)

	F1 = Fellow.create(first_name: "Cent", last_name: "Amadi", email: "tru2cent@gmail.com", session_id: S1)
	F2 = Fellow.create(first_name: "Olatoyosi", last_name: "Famakinde", email: "olatoyosi@gmail.com", session_id: S1)
	F3 = Fellow.create(first_name: "Daisi", last_name: "Sowemimo", email: "daisi.sowemimo@gmail.com", session_id: S1)

	User.create([
		{ username: "cent", password: "cent", role: "Admin", fellow_id: F1 },
		{ username: "toyosi", password: "toyosi", role: "Fellow", fellow_id: F2 },
		{ username: "daisi", password: "daisi", role: "Fellow", fellow_id: F3 }
	])
		F1.days << [D11, D21]
		F2.days << [D11, D21, D31]
		F3.days << [D11, D31]
