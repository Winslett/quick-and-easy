FactoryGirl.define do
  factory :post do |p|
    title Faker::Lorem.words

    creator { |p| u = Factory(:user); Factory(:creator, :name => u.name, :email => u.email, :user_id => u.id) }
    message { |p| Factory(:message, :title => p.title, :user_id => p.creator.user_id) }
  end

  factory :message do
    title Faker::Lorem.words
    body Faker::Lorem.paragraphs

    user { Factory(:user) }
  end

  factory :creator do
    name Faker::Name.name
    email Faker::Internet.email

    user { |c| Factory :user, name: c.name, email: c.email }
  end

  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password Faker::Lorem.words(3).join(" ")
    password_confirmation { |s| s.password }
  end
end
