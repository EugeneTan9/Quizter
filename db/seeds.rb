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

  badge1 = Badge.new({user_id:1, quiz_id: 1, title: "Novice Jedi Badge", criteria: 50})
  badge1.save
  badge1.img_url.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'badgeimg.png')), filename: 'badgeimg.png')
  badge1.save
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
    {quiz_id: 1, body: "In layman's terms, The Force is..."},
    {quiz_id: 1, body: "The Sith were formed during...."},
    {quiz_id: 1, body: "Which Akira Kurosawa film inspired George Lucas?"},
    {quiz_id: 1, body: "Who is one of the first to die because of Han Solo in Episode IV?"},
    {quiz_id: 1, body: "How exactly did Princess Leia end up in that bikini?"},

    {quiz_id: 1, body: "Which original character name was NOT in the first draft?"},
    {quiz_id: 1, body: "What exactly is a Jedi mind trick?"},
    {quiz_id: 1, body: "What do Luke and Han fight at the beginning of Episode VI to avoid death?"},
    {quiz_id: 1, body: "What type of droid is R2D2?"},
    {quiz_id: 1, body: "How do the Rebels defeat the Empire?"}
  ])


  Option.create!([
  {question_id: 1, choice: "the energy field that connects all living things in the galaxy", isAnswer: true},
  {question_id: 1, choice: "the inner energy that allows the Jedi to harness their power"},
  {question_id: 1, choice: "a Life Force that renders one's spirit immortal"},
  {question_id: 1, choice: "the chi used by the Jedi to defeat external forces"},

  {question_id: 2, choice: "Hundred Year Darkness", isAnswer: true},
  {question_id: 2, choice: "Dark age"},
  {question_id: 2, choice: "The Clone Wars"},
  {question_id: 2, choice: "Imperial Era"},

  {question_id: 3, choice: "The Hidden Fortress", isAnswer: true},
  {question_id: 3, choice: "No Regrets for Our Youth"},
  {question_id: 3, choice: "Ikiru"},
  {question_id: 3, choice: "Dersu Uzala"},

  {question_id: 4, choice: "Greedo the Rodian", isAnswer: true},
  {question_id: 4, choice: "Jas Emari, bounty hunter"},
  {question_id: 4, choice: "4-LOM, hunter droid"},
  {question_id: 4, choice: "Bossk"},

  {question_id: 5, choice: "Princess Leia infiltrates Jabba's palace.", isAnswer: true},
  {question_id: 5, choice: "Princess Leia doesn't communicate her entire plan to Chewbacca."},
  {question_id: 5, choice: "Luke arrived too late to help."},
  {question_id: 5, choice: "Lando Calrissian betrays Princess Leia."},

  {question_id: 6, choice: "Princess Dharma", isAnswer: true},
  {question_id: 6, choice: "Annikin Starkiller"},
  {question_id: 6, choice: "Mace Windy"},
  {question_id: 6, choice: "CJ Thorpe"},

  {question_id: 7, choice: "The ability to change a person's will or perception using the Force", isAnswer: true},
  {question_id: 7, choice: "Electroencephalography that lets Jedi read other people's beta waves"},
  {question_id: 7, choice: "The ability to implant memories into others"},
  {question_id: 7, choice: "The ability to read someone else's mind through sense of the Force"},

  {question_id: 8, choice: "Sarlacc", isAnswer: true},
  {question_id: 8, choice: "Rancor"},
  {question_id: 8, choice: "Karbin"},
  {question_id: 8, choice: "Morley"},

  {question_id: 9, choice: "Astromech", isAnswer: true},
  {question_id: 9, choice: "Maintenance"},
  {question_id: 9, choice: "Protocol"},
  {question_id: 9, choice: "Gladiator"},

  {question_id: 10, choice: "The strike team destroys the shield generator.", isAnswer: true},
  {question_id: 10, choice: "Luke convinces his father to rejoin the Jedi."},
  {question_id: 10, choice: "Anakin Skywalker comes through and abdicates his position."},
  {question_id: 10, choice: "Princess Leia and Han Solo steal a TIE fighter."},
  ])