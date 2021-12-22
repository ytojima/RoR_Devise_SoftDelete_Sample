# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  { email: 'user1@example.com', password: 'passw@rd' },
  { email: 'user2@example.com', password: 'passw@rd' },
  { email: 'user3@example.com', password: 'passw@rd' },
  { email: 'user4@example.com', password: 'passw@rd' },
  { email: 'user5@example.com', password: 'passw@rd' },
]

users.each do |user|
  # 一度ユーザーをメールアドレスで検索
  user_data = User.find_by(email: user[:email])
  # 該当ユーザーがいなければ、createする
  if user_data.nil?
    User.create(
      email: user[:email],
      password: user[:password]
    )
  end
end