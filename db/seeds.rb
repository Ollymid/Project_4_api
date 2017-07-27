[User, Log, DiveSite].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

olly = User.create!(username: "ollymid", first_name: "olly", last_name: "middleton", email: "olly@olly.com", password: "password", password_confirmation: "password", diving_level: "PADI OW Instructor")
lucy = User.create!(username: "lucymid", first_name: "lucy", last_name: "middleton", email: "lucy@lucy.com", password: "password", password_confirmation: "password", diving_level: "PADI Open Water Diver")


site1 = DiveSite.create!(name: "Coral Gardens", water_type: "salt", dive_type: "boat, night dive", lat: -16.725453, lng: 146.276663, max_depth: 20, country: "Australia", creator: olly)
site2 = DiveSite.create!(name: "Scapa Flow", water_type: "salt", dive_type: "boat, night dive", lat: 58.903015, lng:  -3.051202, max_depth: 30, country: "Scotland", creator: lucy)


Log.create!(date: Date.new(2017, 4, 28), user: olly, dive_site: site1, dive_time: 45, gear: "mask, snorkel, 6kg weights", comments: "Saw a big fish - Nitrox dive", visibility: "20", temperature: 27)
Log.create!(date: Date.new(2017, 4, 28), user: lucy, dive_site: site2, dive_time: 45, gear: "mask, snorkel, 6kg weights", comments: "Saw a big fish - Nitrox dive", visibility: "20", temperature: 27)
