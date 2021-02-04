require 'faker'

User.destroy_all
Gossip.destroy_all
City.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all
Tag.destroy_all
Like.destroy_all

10.times do
  City.create!(
    city_name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: 8),
    email: Faker::Internet.free_email,
    age: rand(15..80),
    city_id: City.all.sample.id
  )
end

5.times do
  #Le message est créé avec un expéditeur et un contenu.
  new_message = PrivateMessage.create!(
    content: Faker::Quote.yoda,
    sender_id: User.all.sample.id
  )
  #On rajoute des destinataires, entre 1 et 5.
  new_message.recipients << User.all.sample(rand(1..5))
end

10.times do
  Tag.create!(
    title: Faker::Hipster.word
  )
end

20.times do
  new_gossip = Gossip.create!(
    title: Faker::Lorem.sentence(word_count: 8),
    content: Faker::GreekPhilosophers.quote,
    user_id: User.all.sample.id
  )
  new_gossip.tags << Tag.all.sample(rand(1..10))
end

20.times do
  new_comment = Comment.create!(
    content: Faker::ChuckNorris.fact,
    gossip_id: Gossip.all.sample.id,
    user_id: User.all.sample.id
  )
  #Ajout des commentaires de commentaires
  rand(0..5).times do
    new_comment.comments << Comment.create!(
      content: Faker::Quotes::Chiquito.sentence,
      user_id: User.all.sample.id
    )
  end
end

20.times do
  liking_user = User.all.sample.id
  #Le like est aléatoirement placé soit sur un gossip, soit sur un commentaire.
  is_like = rand(0..1)
  if is_like == 0
    Like.create!(
      user_id: liking_user,
      gossip_id: Gossip.all.sample.id
    )
  else
    Like.create!(
      user_id: liking_user,
      comment_id: Comment.all.sample.id
    )
  end
end