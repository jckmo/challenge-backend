@master = User.create(username: 'Master', password: '1111', is_master?: true)


@counter = 2

def counter_as_password
  "#{@counter}#{@counter}#{@counter}#{@counter}"
end

25.times do
  User.create(username: Faker::Name.first_name, password: counter_as_password, is_master?: false)
  @counter +=1
end

@garland = User.find(2)
@benton = User.find(3)

@movies1 = [
  {
    title: 'Kill Bill: Vol. 1',
    year: '2003',
    poster: 'https://m.media-amazon.com/images/M/MV5BNzM3NDFhYTAtYmU5Mi00NGRmLTljYjgtMDkyODQ4MjNkMGY2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg',
    nominations: 10
  },
  {
    title: 'Kill Bill: Vol. 2',
    year: '2004',
    poster: 'https://m.media-amazon.com/images/M/MV5BNmFiYmJmN2QtNWQwMi00MzliLThiOWMtZjQxNGRhZTQ1MjgyXkEyXkFqcGdeQXVyNzQ1ODk3MTQ@._V1_SX300.jpg',
    nominations: 8
  },
  {
    title: 'Ex Machina',
    year: '2014',
    poster: 'https://m.media-amazon.com/images/M/MV5BMTUxNzc0OTIxMV5BMl5BanBnXkFtZTgwNDI3NzU2NDE@._V1_SX300.jpg',
    nominations: 6
  },
]

@movies1.each do |title|
  @master.titles.create(title: title[:title], year: title[:year], poster: title[:poster], nominations: title[:nominations])
  
end

@movies2 = [
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
]

@movies2.each do |title|
  @garland.titles.create(title: title[:title], year: title[:year], poster: title[:poster], nominations: title[:nominations])
end

@movies3 = [
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

@movies3.each do |title|
  @benton.titles.create(title: title[:title], year: title[:year], poster: title[:poster], nominations: title[:nominations])
end