Fabricator(:poll) do

  title    { Faker::Name.name }
  edit_url { SecureRandom.urlsafe_base64(6) }

end
