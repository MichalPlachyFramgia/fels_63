User.create! name:  "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true,
  active: true,
  activated_at: Time.zone.now

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password,
    active: true,
    activated_at: Time.zone.now
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow followed}
followers.each {|follower| follower.follow user}

word_id = 0
10.times do |n|
  name = Faker::Name.title
  content = Faker::Lorem.paragraph
  Category.create! name: name, content: content
  20.times do |n2|
    content = Faker::Lorem.word
    category_id = n+1
    word_id = word_id + 1
    Word.create! content: content, category_id: category_id
    Answer.create! correct: 1, content: Faker::Lorem.word, word_id: word_id
    3.times do |n1|
      correct = 0
      content = Faker::Lorem.word
      Answer.create! correct: correct, content: content, word_id: word_id
    end
  end
end
