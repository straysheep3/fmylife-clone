ghost = Category.create(name: "Ghost")
witch = Category.create(name: "Witch")
monster = Category.create(name: "Monster")
stalker = Category.create(name: "Stalker")
night = Category.create(name: "Night")
children = Category.create(name: "Children")

user = User.create(name: "kage", email: "kage@mail.com", password: "kagekage")

30.times do
  Story.create(body: "Hello world!", user_id: 1, category_id: rand(1..6) )
end
