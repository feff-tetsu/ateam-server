# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

['1','2','3'].each do |id|
   User.create!({ email: "test@test#{id}", password: "testtest"})
end

num = 1
File.foreach("./db/baggage.csv") do |line|
    data = line.split(',')
    name = data[0].delete!('"')
    size = data[1]
    sex = data[2]
    genre = data[3]
    bland = data[5]
    points = data[6].to_i
    photo_url = data[7]
    rental_enabled = num%9 == 0 ? false : true
    Baggage.create!(
        user_id: User.last.id, 
        name: name,
        size: size,
        sex: sex,
        genre: genre,
        points: points,
        bland: bland,
        photo_url: photo_url.chomp,
        rental_enabled: rental_enabled
    )
    num += 1
end

User.create!({ email: "test@ateam.com", password: "ateampass", user_name: "sanamaru", points: 2000, avatar_url: "https://s3-ap-northeast-1.amazonaws.com/ateam-demoapp/avatar.png"})

