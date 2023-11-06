# lib/tasks/i_am_lazy.rake



task(:sample_contacts => :environment) do

  if Rails.env.development?
    Contact.destroy_all
  end

  200.times do
    c = Contact.new
    c.first_name = Faker::Name.first_name
    c.last_name = Faker::Name.last_name
    c.date_of_birth = Faker::Date.birthday(min_age: 0, max_age: 120)
    c.street_address_1 = Faker::Address.street_address
    c.street_address_2 = Faker::Address.secondary_address
    c.city = Faker::Address.city
    c.state = Faker::Address.state_abbr
    c.zip = Faker::Address.zip
    c.phone = Faker::PhoneNumber.phone_number
    c.notes = Faker::Movies::HarryPotter.quote

    c.save
  end
end
