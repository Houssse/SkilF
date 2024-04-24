30.times do
  
  id = 1
  title = Faker::Hipster.sentence(word_count: 3)
  body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)

  Article.create title: title, body: body, user_id: id
end