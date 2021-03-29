# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# names = 100.times.map {"#{Faker::Name.unique.first_name} #{Faker::Name.last_name}"}

# emails = 100.times.map.with_index {|n, i| Faker::Internet.free_email(name: names[i])}

# passwords = 100.times.map {"123"}

# user_params_array = names.map.with_index {|name, i| Hash.new.tap {|hash| hash[:name] = name; hash[:email] = emails[i]; hash[:password] = passwords[i]}}

# user_params_array.each {|user_params| User.create(user_params)}