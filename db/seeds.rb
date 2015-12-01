class Seed
  def self.start
    seed = Seed.new
    seed.generate_platform_admin
    seed.generate_businesses
    seed.generate_users
    seed.generate_photos
    seed.generate_business_admin
  end

  def generate_platform_admin
    User.create!(username: "jorge@turing.io",
                 password: "password",
                 role: 2)
  end

  def generate_business_admins
    10.times do |i|
      business_admins = User.create!(name: "andrew@turing.io",
                                     password: "password",
                                     role: 1 )

  def generate_businesses
    20.times do |i|
      business = Business.create!(name: FFaker::Company.name,
                                 location: FFaker::AddressUS.state,
                                 bio: FFaker::HipsterIpsum.phrase
                                 )
      puts "#{i+1}: #{business.name} business created!"
    end
  end

  def generate_users
    100.times do |i|
      user = User.create!(username: FFaker::Internet.user_name,
                          password: FFaker::HipsterIpsum.word,
                          role: 0
                          )
      puts "#{i+1}: #{user.username} with '#{user.password}' password created!"
    end
  end

  def generate_photos
    200.times do |i|
      photo = Photo.create(name: FFaker::Name.first_name,
                           price: rand(10..20),
                           description: FFaker::HipsterIpsum.phrase
                           )
      puts "#{i}: #{photo.name} photo created!"
    end
  end
end

Seed.start
