user1 = User.new({email: "ray@gmail.com", username: "ray", password: "password", isAdmin: false, isActive: true, isPublic: true})
user1.save
# user1.dp.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'badgeimg.png')), filename: 'badgeimg.png')
user2 = User.new({email: "eugene@gmail.com", username: "eugene", password: "password", isAdmin: false, isActive: true, isPublic: true})
user2.save

user3 = User.new({email: "kevin@gmail.com", username: "kevin", password: "password", isAdmin: false, isActive: true, isPublic: true})
user3.save

user4 = User.new({email: "admin@gmail.com", username: "testadmin", password: "password", isAdmin: true, isActive: true, isPublic: true})
user4.save

  Quiz.create!([
    {user_id: 1, title: "Star Wars Jedi Master Quiz", description: "Davids quiz on star wars. Get All correct and be a master jedi.", img_url: "/test/jedimaster.png"},
    {user_id: 3, title: "Avengers Hero Quiz", description: "Kevins Quiz to prove he is a mighty Avenger", img_url: "/test/bananakiller.png"}
  ])



  # Badge.create!([
  #   {user_id: 1, quiz_id: 1, title: "Novice Jedi Badge", criteria: 50}
  #   {user_id: 1, quiz_id: 1, title: "Master Jedi Badge", criteria: 75},
  #   {user_id: 3, quiz_id: 2, title: "Avengers Badge", criteria: 75}
  # ])

  badge1 = Badge.new({quiz_id: 1, title: "Novice Jedi Badge", criteria: 50})
  badge1.save
  badge1.img_url.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'badgeimg.png')), filename: 'badgeimg.png')
  badge1.save

  badge2 = Badge.new({quiz_id: 1, title: "Master Jedi Badge", criteria: 75})
  badge2.save
  badge2.img_url.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'badgeimg.png')), filename: 'badgeimg.png')
  badge2.save

  badge3 = Badge.new({quiz_id: 2, title: "Avengers Badge", criteria: 75})
  badge3.save
  badge3.img_url.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'badgeimg.png')), filename: 'badgeimg.png')
  badge3.save

  users = [user1,user2,user3,user4]
  users.each do |user|
    5.times do |n|
      Quiz.create({user_id: user.id, title: FFaker::Lorem.sentence, description: FFaker::Lorem.sentences, img_url: "/test/bananakiller.png"})
    end
  end

  BadgesUser.create!([
    {user_id: 1, badge_id: 1},
    {user_id: 1, badge_id: 2},
    {user_id: 2, badge_id: 1},
    {user_id: 2, badge_id: 2},
    {user_id: 3, badge_id: 1},
    {user_id: 3, badge_id: 2}
  ])

  Result.create!([
    {user_id: 1, quiz_id: 1, quiz_result: 100},
    {user_id: 1, quiz_id: 2, quiz_result: 40},
    {user_id: 2, quiz_id: 1, quiz_result: 80},
    {user_id: 2, quiz_id: 2, quiz_result: 100},
    {user_id: 3, quiz_id: 1, quiz_result: 100},
    {user_id: 3, quiz_id: 2, quiz_result: 100},
  ])

  Question.create!([
    {quiz_id: 1, question_num: 1, body: "In layman's terms, The Force is...", body_type: "Q"},
    {quiz_id: 1, question_num: 1, body: "the energy field that connects all living things in the galaxy", body_type: "C"},
    {quiz_id: 1, question_num: 1, body: "the inner energy that allows the Jedi to harness their power", body_type: "F"},
    {quiz_id: 1, question_num: 1, body: "a Life Force that renders one's spirit immortal", body_type: "F"},
    {quiz_id: 1, question_num: 1, body: "the chi used by the Jedi to defeat external forces", body_type: "F"},
  
    {quiz_id: 1, question_num: 2, body: "The Sith were formed during....", body_type: "Q"},
    {quiz_id: 1, question_num: 2, body: "Hundred Year Darkness", body_type: "C"},
    {quiz_id: 1, question_num: 2, body: "Dark age", body_type: "F"},
    {quiz_id: 1, question_num: 2, body: "The Clone Wars", body_type: "F"},
    {quiz_id: 1, question_num: 2, body: "Imperial Era", body_type: "F"},
  
    {quiz_id: 1, question_num: 3, body: "Which Akira Kurosawa film inspired George Lucas?", body_type: "Q"},
    {quiz_id: 1, question_num: 3, body: "The Hidden Fortress", body_type: "C"},
    {quiz_id: 1, question_num: 3, body: "No Regrets for Our Youth", body_type: "F"},
    {quiz_id: 1, question_num: 3, body: "Ikiru", body_type: "F"},
    {quiz_id: 1, question_num: 3, body: "Dersu Uzala", body_type: "F"},
  
    {quiz_id: 1, question_num: 4, body: "Who is one of the first to die because of Han Solo in Episode IV?", body_type: "Q"},
    {quiz_id: 1, question_num: 4, body: "Greedo the Rodian", body_type: "C"},
    {quiz_id: 1, question_num: 4, body: "Jas Emari, bounty hunter", body_type: "F"},
    {quiz_id: 1, question_num: 4, body: "4-LOM, hunter droid", body_type: "F"},
    {quiz_id: 1, question_num: 4, body: "Bossk", body_type: "F"},
  
    {quiz_id: 1, question_num: 5, body: "How exactly did Princess Leia end up in that bikini?", body_type: "Q"},
    {quiz_id: 1, question_num: 5, body: "Princess Leia infiltrates Jabba's palace.", body_type: "C"},
    {quiz_id: 1, question_num: 5, body: "Princess Leia doesn't communicate her entire plan to Chewbacca.", body_type: "F"},
    {quiz_id: 1, question_num: 5, body: "Luke arrived too late to help.", body_type: "F"},
    {quiz_id: 1, question_num: 5, body: "Lando Calrissian betrays Princess Leia.", body_type: "F"},
  
    {quiz_id: 1, question_num: 6, body: "Which original character name was NOT in the first draft?", body_type: "Q"},
    {quiz_id: 1, question_num: 6, body: "Princess Dharma", body_type: "C"},
    {quiz_id: 1, question_num: 6, body: "Annikin Starkiller", body_type: "F"},
    {quiz_id: 1, question_num: 6, body: "Mace Windy", body_type: "F"},
    {quiz_id: 1, question_num: 6, body: "CJ Thorpe", body_type: "F"},
    
    {quiz_id: 1, question_num: 7, body: "What exactly is a Jedi mind trick?", body_type: "Q"},
    {quiz_id: 1, question_num: 7, body: "The ability to change a person's will or perception using the Force", body_type: "C"},
    {quiz_id: 1, question_num: 7, body: "Electroencephalography that lets Jedi read other people's beta waves", body_type: "F"},
    {quiz_id: 1, question_num: 7, body: "The ability to implant memories into others", body_type: "F"},
    {quiz_id: 1, question_num: 7, body: "The ability to read someone else's mind through sense of the Force", body_type: "F"},
  
    {quiz_id: 1, question_num: 8, body: "What do Luke and Han fight at the beginning of Episode VI to avoid death?", body_type: "Q"},
    {quiz_id: 1, question_num: 8, body: "Sarlacc", body_type: "C"},
    {quiz_id: 1, question_num: 8, body: "Rancor", body_type: "F"},
    {quiz_id: 1, question_num: 8, body: "Karbin", body_type: "F"},
    {quiz_id: 1, question_num: 8, body: "Morley", body_type: "F"},
  
    {quiz_id: 1, question_num: 9, body: "What body_type of droid is R2D2?", body_type: "Q"},
    {quiz_id: 1, question_num: 9, body: "Astromech", body_type: "C"},
    {quiz_id: 1, question_num: 9, body: "Maintenance", body_type: "F"},
    {quiz_id: 1, question_num: 9, body: "Protocol", body_type: "F"},
    {quiz_id: 1, question_num: 9, body: "Gladiator", body_type: "F"},
  
    {quiz_id: 1, question_num: 10, body: "How do the Rebels defeat the Empire?", body_type: "Q"},
    {quiz_id: 1, question_num: 10, body: "The strike team destroys the shield generator.", body_type: "C"},
    {quiz_id: 1, question_num: 10, body: "Luke convinces his father to rejoin the Jedi.", body_type: "F"},
    {quiz_id: 1, question_num: 10, body: "Anakin Skywalker comes through and abdicates his position.", body_type: "F"},
    {quiz_id: 1, question_num: 10, body: "Princess Leia and Han Solo steal a TIE fighter.", body_type: "F"}
    ])