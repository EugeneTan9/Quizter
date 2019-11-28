User.create!([
    {email: "david@gmail.com", username: "david", password: "password", isAdmin: false, dp: "https://web.aflia.net/wp-content/uploads/2018/12/dp_placeholder-275x300.jpg", isActive: true, isPublic: true},
    {email: "eugene@gmail.com", username: "eugene", password: "password", isAdmin: false, dp: "https://web.aflia.net/wp-content/uploads/2018/12/dp_placeholder-275x300.jpg", isActive: true, isPublic: true},
    {email: "kevin@gmail.com", username: "kevin", password: "password", isAdmin: false, dp: "https://web.aflia.net/wp-content/uploads/2018/12/dp_placeholder-275x300.jpg", isActive: true, isPublic: true},
    {email: "admin@gmail.com", username: "testadmin", password: "password", isAdmin: true, dp: "https://web.aflia.net/wp-content/uploads/2018/12/dp_placeholder-275x300.jpg", isActive: true, isPublic: true}
  ])

  Quiz.create!([
    {user_id: 1, title: "Star Wars Jedi Master Quiz", description: "Davids quiz on star wars. Get All correct and be a master jedi.", img_url: "/test/jedimaster.png"},
    {user_id: 3, title: "Avengers Hero Quiz", description: "Kevins Quiz to prove he is a mighty Avenger", img_url: "/test/bananakiller.png"}
  ])

  
  Badge.create!([
    {user_id: 1, quiz_id: 1, title: "Novice Jedi Badge", criteria: 50, img_url: "/test/jedinovice.png"},
    {user_id: 1, quiz_id: 1, title: "Master Jedi Badge", criteria: 75, img_url: "/test/jedimaster.png"},
    {user_id: 3, quiz_id: 2, title: "Avengers Badge", criteria: 75, img_url: "/test/bananakiller.png"}
  ])
