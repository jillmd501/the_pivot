require 'time'

class Seed
  def self.start
    start = Time.now
    seed = Seed.new
    seed.generate_roles
    seed.generate_businesses
    seed.generate_users
    seed.generate_business_admins
    seed.generate_categories
    seed.generate_platform_admin
    seed.generate_sizes
    seed.generate_us
    seed.generate_photos
    sleep(2)
    finish = Time.now
    puts "seed done in #{finish - start} minutes"
  end

  def generate_categories
    categories = %w(cool b&w creepy love nature day night children men women)
    categories.each do |name|
      Category.create!(name: name)
    end
    puts "made some sweet categories\n\n"
    sleep(2)
  end

  def generate_sizes
    Size.create!(name: "Thumbnail" , dimension: "64x64", price: 10)
    Size.create!(name: "Small", dimension: "480x320", price: 15)
    Size.create!(name: "Medium", dimension: "960x640", price: 20)
    Size.create!(name: "Large", dimension: "1920x1280", price: 25)
    puts "Made some sizes and junk\n\n"
    sleep(2)
  end

  def generate_platform_admin
    user = User.new(username: "jorge@turing.io",
                     password: "password",
                     first_name: 'Jorge',
                     last_name: "Téllez",
                     email: 'jorge@turing.io'
                     )
    user.avatar = open('https://s3.amazonaws.com/pivotphotos1/jorge.jpg')
    user.save!
    user.roles << Role.find_by(name: "registered_user")
    user.roles << Role.find_by(name: "platform_admin")
    puts "generated platform admin with username:#{user.username} and password #{user.password}\n\n"
    sleep(2)
  end

  def generate_business_admins
    20.times do |i|
      if i == 0
        business_admin = User.new(username: "andrew@turing.io",
                                  password: "password",
                                  first_name: "andrew",
                                  last_name: "#{i}",
                                  email: "andrew#{i}@turing.com"
                                  )
        business_admin.avatar = open('https://s3.amazonaws.com/pivotphotos1/andrew.jpg')
        business_admin.save!
      else
        business_admin = User.new(username: "andrew#{i}@turing.io",
                                  password: "password",
                                  first_name: "andrew#{i}",
                                  last_name: "#{i}",
                                  email: "andrew#{i}@turing.com"
                                  )
        business_admin.avatar = open('https://s3.amazonaws.com/pivotphotos1/andrew.jpg')
        business_admin.save!
      end
      business_admin.roles << Role.find_by(name: "registered_user")
      business_admin.roles << Role.find_by(name: "business_admin")
      business_admin.businesses << Business.find(i + 1)
      puts "generate business admin with username:#{business_admin.username} and password #{business_admin.password}"
     end
     puts "\n\n"
     puts "done generating business admins\n\n"
   end

  def generate_businesses
    20.times do |i|
      business = Business.create!(name: FFaker::Company.name,
                                  location: FFaker::AddressUS.state,
                                  bio: FFaker::HipsterIpsum.phrase,
                                  status: "Online"
                                 )
      puts "#{i+1}: #{business.name} business created!"
    end
    puts "I'm done generating businesses :D"
    puts "\n\n"
    sleep(2)
  end

  def generate_users
    100.times do
      generate_user
    end
    puts "I'm finished generating users now :)\n\n"
    sleep(2)
  end

  def generate_roles
    roles = %w(registered_user business_admin platform_admin)
    roles.each do |role|
      Role.create(name: role)
    end
    puts "Generated roles!!!!!!!! XD XD XD\n\n"
    sleep(2)
  end

  def generate_us
    jill = User.new(username: "jillmd",
                    password: "password",
                    first_name: "Jill",
                    last_name: "Donohue",
                    email: "jillmd@gmail.com"
                    )
    jill.avatar = open("https://avatars2.githubusercontent.com/u/11321261?v=3&s=460")
    jill.save!

    puts "created jill s( ^ ‿ ^)-b"

    ross = User.new(username: "rossedfort",
                    password: "password",
                    first_name: "Ross",
                    last_name: "Edfort",
                    email: "rossedfort@yahoo.com"
                    )
    ross.avatar = open('https://s3.amazonaws.com/pivotphotos1/ross.jpg')
    ross.save!

    puts 'created ross ლ(▀̿̿Ĺ̯̿̿▀̿ლ)'

    jerrod = User.new(username: "unsafepond",
                      password: "password",
                      first_name: "Jerrod",
                      last_name: "Junker",
                      email: "unsafepond@example.com"
                      )
    jerrod.avatar = open('https://avatars2.githubusercontent.com/u/12161598?v=3&s=460')
    jerrod.save!

    puts 'created jerrod ¯\_(ツ)_/¯'

    Role.all.each do |role|
      jill.roles << Role.find(role.id)
      ross.roles << Role.find(role.id)
      jerrod.roles << Role.find(role.id)
    end

    Business.first(5).each do |bus|
      ross.businesses << Business.find(bus.id)
      jill.businesses << Business.find(bus.id)
      jerrod.businesses << Business.find(bus.id)
    end
  end

  def generate_photos
    500.times do
      photo = Photo.new(name: 'jorge', description: "jajajajajaja", category_id: rand(1..10), business_id: rand(1..20))
      photo.image = open('/Users/rossedfort/Desktop/jorge.jpg')
      photo.save!
    end
  end

  private

  def generate_user
    username = FFaker::Internet.user_name
    user = User.find_by(username: username)
    if user
      generate_user
    else
      user = User.create!(username: username,
                          password: FFaker::Internet.password,
                          first_name: FFaker::Name.first_name,
                          last_name: FFaker::Name.last_name,
                          email: FFaker::Internet.safe_email
                         )
      user.roles << Role.find_by(name: "registered_user")
      puts "#{user.username} with '#{user.password}' password created!"
    end
  end
end



Seed.start
