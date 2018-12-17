5.times do
  Artical.create({
    title: Faker::Book.title,
    body: Faker::Lorem.sentence
    })
  end
