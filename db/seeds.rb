User.create(username: 'Master', password: '1111', is_master?: true)

@counter = 2

def counter_as_password
  "#{@counter}#{@counter}#{@counter}#{@counter}"
end

25.times do
  User.create(username: Faker::Name.first_name, password: counter_as_password, is_master?: false)
  @counter +=1
end