elmo   = User.create(email: "elmo@sesame.street.com", 
                     password_digest: BCrypt::Password.create("password"))
oscar  = User.create(email: "oscar.the.grouch@sesame.street.com", 
                     password_digest: BCrypt::Password.create("password"))
harry  = User.create(email: "harry.potter@hogwarts.edu", 
                     password_digest: BCrypt::Password.create("password"))

pixies = Band.create!(name: "The Pixies")
twin   = Band.create!(name: "Twin Sister")
toro   = Band.create!(name: "Toro y Moi")
lcd    = Band.create!(name: "LCD Soundsystem")

doolittle = Album.create!(title:   "Doolittle", 
                          band_id: pixies.id,
                          live:    false)
in_heaven = Album.create!(title:   "In Heaven", 
                          band_id: twin.id,
                          live:    false)
causers   = Album.create!(title:   "Causers of This", 
                          band_id: toro.id,
                          live:    false)
shut_up   = Album.create!(title:   "Shut Up and Play the Hits",
                          band_id: lcd.id,
                          live:    true)