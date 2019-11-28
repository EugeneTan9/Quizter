user1 = User.new({email: "david@gmail.com", username: "david", password: "password", isAdmin: false, dp: "https://web.aflia.net/wp-content/uploads/2018/12/dp_placeholder-275x300.jpg", isActive: true, isPublic: true})
user1.save

user2 = User.new({email: "eugene@gmail.com", username: "eugene", password: "password", isAdmin: false, dp: "https://web.aflia.net/wp-content/uploads/2018/12/dp_placeholder-275x300.jpg", isActive: true, isPublic: true})
user2.save

user3 = User.new({email: "kevin@gmail.com", username: "kevin", password: "password", isAdmin: false, dp: "https://web.aflia.net/wp-content/uploads/2018/12/dp_placeholder-275x300.jpg", isActive: true, isPublic: true})
user3.save

user4 = User.new({email: "admin@gmail.com", username: "testadmin", password: "password", isAdmin: true, dp: "https://web.aflia.net/wp-content/uploads/2018/12/dp_placeholder-275x300.jpg", isActive: true, isPublic: true})
user4.save

  Quiz.create!([
    {user_id: 1, title: "Star Wars Jedi Master Quiz", description: "Davids quiz on star wars. Get All correct and be a master jedi.", img_url: "/test/jedimaster.png"},
    {user_id: 3, title: "Avengers Hero Quiz", description: "Kevins Quiz to prove he is a mighty Avenger", img_url: "/test/bananakiller.png"}
  ])


  
  Badge.create!([
    {user_id: 1, quiz_id: 1, title: "Novice Jedi Badge", criteria: 50, img_url: "/test/jedinovice.png"},
    {user_id: 1, quiz_id: 1, title: "Master Jedi Badge", criteria: 75, img_url: "/test/jedimaster.png"},
    {user_id: 3, quiz_id: 2, title: "Avengers Badge", criteria: 75, img_url: "/test/bananakiller.png"}
  ])

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
    {quiz_id: 1, body: "In layman's terms, The Force is...", answer: "the energy field that connects all living things in the galaxy"},
    {quiz_id: 1, body: "The Sith were formed during....", answer: "Hundred Year Darkness"},
    {quiz_id: 1, body: "Which Akira Kurosawa film inspired George Lucas?", answer: "The Hidden Fortress"},
    {quiz_id: 1, body: "Who is one of the first to die because of Han Solo in Episode IV?", answer: "Greedo the Rodian"},
    {quiz_id: 1, body: "How exactly did Princess Leia end up in that bikini?", answer: "Princess Leia infiltrates Jabba's palace."},
    {quiz_id: 1, body: "Which original character name was NOT in the first draft?", answer: "Princess Dharma"},
    {quiz_id: 1, body: "What exactly is a Jedi mind trick?", answer: "The ability to change a person's will or perception using the Force"},
    {quiz_id: 1, body: "What do Luke and Han fight at the beginning of Episode VI to avoid death?", answer: "Sarlacc"},
    {quiz_id: 1, body: "What type of droid is R2D2?", answer: "Astromech"},
    {quiz_id: 1, body: "How do the Rebels defeat the Empire?", answer: "The strike team destroys the shield generator."}
  ])

