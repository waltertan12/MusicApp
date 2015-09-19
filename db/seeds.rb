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
              lyrics: "Saw you making eyes at me\r\nHotels are loneliest\r\nin little miss New Jersey\r\nBack to work and on your feet\r\nand oh, you're so far away\r\nand God knows when\r\nI'd ever get the chance\r\nto touch your hands\r\nyou know we'll never date let alone be friends\r\nyou're so far away\r\nit hurts so bad\r\n\r\nSoftly walk away from me\r\nGoodbyes are loneliest\r\nWhen you know we'll never meet\r\nFace to face or feet to feet\r\nand oh, you're so far away\r\nand God knows when\r\nI'd ever get the chance\r\nto touch your hands\r\nyou know we'll never date let alone be friends\r\nyou're so far away\r\nit hurts so bad",
              bonus: false)
Track.create!(name: "Bad Street",
              album_id: in_heaven.id,
              lyrics: "Feel it with you, in you feel it\r\nIn you feel it, in you feel it\r\nIn you feel it, in you feel it\r\nIn you feel it\r\n\r\nFeel it with you\r\nIf you feel it in you\r\nMake it a commotion with you\r\nMake it a commotion in you\r\n\r\nSeeing all the glimmer in you\r\nSeeing all the glimmer with you\r\nFeeling with you, feeling in you\r\n\r\nI want it bad, I want it bad\r\nI want it bad, I want it bad\r\nI want it bad, I want it bad\r\n\r\nTell me a story, something I can picture\r\nBad house, bad street\r\nTell me a secret, I won't tell anyone\r\n\r\nBad house, bad street\r\nTell me whatever\r\nGive me something to do\r\nBad house, bad street\r\n\r\nMake me a promise 'cause\r\nI want it bad, I want it bad\r\nI want it bad, I want it bad\r\nI want it bad, I want it bad\r\n\r\nBad house, bad street\r\nBig hands, big feet\r\nGot a car, beet, beet\r\nBad boy, bad street\r\n\r\nGood kids, two kids\r\nGot a job, feeds three",
              bonus: false)
Track.create!(name: "Space Babe",
              album_id: in_heaven.id,
              lyrics: "Time, taking its time\r\nTo land through the sky\r\nI'd be there by now\r\nTo see where you live",
              bonus: false)
Track.create!(name: "Kimmi in a Rice Field",
              album_id: in_heaven.id,
              lyrics: "At first the sky was empty\r\nKimmi's feet follow\r\nThe path to the edge\r\nNear the road\r\nA boy passes\r\nGuiding his bike\r\nHe waves hello.",
              bonus: false)