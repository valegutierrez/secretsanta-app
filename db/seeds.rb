# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |i|
    @user = User.new(
        email: "User#{i + 1}@gmail.com",
        name: "User #{i + 1}",
        password: "123456"
    )
    @user.save!
    @user.image.attach(File.open(File.join(Rails.root,'app/assets/images/new-profile.jpg')))
    @event = Event.new(
        title: "Event #{i + 1}",
        description: "A event.",
        members: 2,
        price_start: 0,
        price_end: 1000,
        deadline: "2019-09-30 20:30:30",
        admin_id: @user.id
    )
    @event.save!
end