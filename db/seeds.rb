[User, Log, Dive_site].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

olly = User.create!(username: "ollymid", first_name: "olly", last_name: "middleton", email: "olly@olly.com", password: "password", password_confirmation: "password" )
olly = User.create!(username: "ollymid", first_name: "olly", last_name: "middleton", email: "olly@olly.com", password: "password", password_confirmation: "password" )


site1 = Event.create!(name: "Coral Gardens", )
site2 = Event.create!(name: "Darth Vader", date: Date.new(2017, 4, 28), location: "Black Horse, Leman Street, London", user: emily, attendees: [mark, mike, sam])


Log.create!(user: olly, event: site1, date: Date.new(2017, 4, 28), )
Log.create!(user: lucy, event: site2, date: Date.new(2017, 4, 29), )
