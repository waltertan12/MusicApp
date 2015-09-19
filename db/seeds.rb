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

Track.create!(name: "Monkey Gone to Heaven",
              album_id: doolittle.id,
              lyrics: "WOW",
              bonus: false)

= Track.create!(name: "Stop",
                album_id: in_heaven.id,
                lyrics: "Here in another land giving up all of my trials\r\nLittle did I think that you'd be doing the same for me,\r\nFor me\r\n\r\nWhere this goes I'm trailing behind cause\r\nI can't tell myself to stop\r\nTo stop to feel\r\nFeel if I like it\r\n\r\nI keep telling myself to stop\r\nI hear it ringing\r\nI keep telling myself to stop\r\nAm I already with you oh what do we do now?\r\n\r\nSome day it's all over\r\nWill I remember the scenery then?\r\nThe stampede we will all part from\r\nSo close to my skeleton\r\nMaybe it's foolish to wanna be alone\r\nI keep telling myself to stop\r\nTo stop and feel\r\nFeel if I like it\r\n",
                bonus: false)


Track.create!(name: "Daniel",
              album_id: in_heaven.id,
              lyrics: "wowyeywow",
              bonus: false)
Track.create!(name: "Bad Street",
              album_id: in_heaven.id,
              lyrics: "wowyeywow",
              bonus: false)
Track.create!(name: "Space Babe",
              album_id: in_heaven.id,
              lyrics: "wowyeywow",
              bonus: false)
Track.create!(name: "Kimmi in a Rice Field",
              album_id: in_heaven.id,
              lyrics: "wowyeywow",
              bonus: false)