@master = User.create(username: 'Master', password: '1111', is_master?: true)

@counter = 2

def counter_as_password
  "#{@counter}#{@counter}#{@counter}#{@counter}"
end

25.times do
  User.create(username: Faker::Name.first_name, password: counter_as_password, is_master?: false)
  @counter +=1
end

@movies = [
  {
    title: 'Kill Bill: Vol. 1',
    year: '2003',
    poster: 'https://m.media-amazon.com/images/M/MV5BNzM3NDFhYTAtYmU5Mi00NGRmLTljYjgtMDkyODQ4MjNkMGY2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg',
    nominations: 0
  },
  {
    title: 'Kill Bill: Vol. 2',
    year: '2004',
    poster: 'https://m.media-amazon.com/images/M/MV5BNmFiYmJmN2QtNWQwMi00MzliLThiOWMtZjQxNGRhZTQ1MjgyXkEyXkFqcGdeQXVyNzQ1ODk3MTQ@._V1_SX300.jpg',
    nominations: 0
  },
  {
    title: 'Ex Machina',
    year: '2014',
    poster: 'https://m.media-amazon.com/images/M/MV5BMTUxNzc0OTIxMV5BMl5BanBnXkFtZTgwNDI3NzU2NDE@._V1_SX300.jpg',
    nominations: 0
  },
  {
  title: 'The Dark Knight',
  year: '2008',
  poster: 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg',
  nominations: 5
  },
  {
  title: 'Scarface',
  year: '1983',
  poster: 'https://m.media-amazon.com/images/M/MV5BNjdjNGQ4NDEtNTEwYS00MTgxLTliYzQtYzE2ZDRiZjFhZmNlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg',
  nominations: 1
  },
  {
  title: 'Interstellar',
  year: '2014',
  poster: 'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg',
  nominations: 4
  },
  {
  title: 'The Lord of the Rings: The Two Towers',
  year: '2002',
  poster: 'https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg',
  nominations: 7
  },
  
  {
  title: 'Les Misérables',
  year: '2012',
  poster: 'https://m.media-amazon.com/images/M/MV5BMTQ4NDI3NDg4M15BMl5BanBnXkFtZTcwMjY5OTI1OA@@._V1_SX300.jpg',
  nominations: 3
  },
  {
  title: 'Troy',
  year: '2004',
  poster: 'https://m.media-amazon.com/images/M/MV5BMTk5MzU1MDMwMF5BMl5BanBnXkFtZTcwNjczODMzMw@@._V1_SX300.jpg',
  nominations: 2
  }
]

@movies.each do |title|
  Title.create(title: title[:title], year: title[:year], poster: title[:poster])
end

@users1 = [1,3,5,7,9,11,13,15,17,4,8,6]
@users2 = [1,4,6,8,10,12,14,16,18,5]
@users3 = [1,9,20,21,22,23,24,25]
@users4 = [3,7,12,20]
@users5 = [17,14,9,10]
@users6 = [21,25,26]
@users7 = [4,5,6,7,8,9,10,11]
@users8 = [4,6]
@users9 = [12,15,17,19,1]

@users1.each do |user|
  @user = User.find(user)
  @user.nominations.create(title_id: 1)
end

@users2.each do |user|
  @user = User.find(user)
  @user.nominations.create(title_id: 2)
end

@users3.each do |user|
  @user = User.find(user)
  @user.nominations.create(title_id: 3)
end

@users4.each do |user|
  @user = User.find(user)
  @user.nominations.create(title_id: 4)
end

@users5.each do |user|
  @user = User.find(user)
  @user.nominations.create(title_id: 5)
end

@users6.each do |user|
  @user = User.find(user)
  @user.nominations.create(title_id: 6)
end

@users7.each do |user|
  @user = User.find(user)
  @user.nominations.create(title_id: 7)
end

@users8.each do |user|
  @user = User.find(user)
  @user.nominations.create(title_id: 8)
end

@users9.each do |user|
  @user = User.find(user)
  @user.nominations.create(title_id: 9)
end