[User, Log, Dive_site].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

olly = User.create!(username: "ollymid", first_name: "olly", last_name: "middleton", email: "emily.isacke@ga.co", password: "password", password_confirmation: "password", )
lucy = User.create!(username: "markjdvs", email: "mark.davis@ga.co", password: "password", password_confirmation: "password")

ball = Event.create!(name: "WDI27 Grad Ball", date: Date.new(2017, 4, 28), location: "Black Horse, Leman Street, London", user: emily, attendees: [mark, mike, sam])

Log.create!(user: olly, event: ball, body: "Can't wait!")
Log.create!(user: lucy, event: ball, body: "Can't wait!")
