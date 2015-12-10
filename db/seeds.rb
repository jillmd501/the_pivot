require 'time'

class Seed
  def self.start
    seed = Seed.new
    seed.generate_roles
    seed.generate_businesses
    seed.generate_users
    seed.generate_categories
    seed.generate_platform_admin
    seed.generate_sizes
    seed.generate_business_admins
  end

  def generate_categories
    categories = %w(cool b&w creepy love nature day night children men women)
    categories.each do |name|
      Category.create!(name: name)
    end
    p "made some sweet categories"
  end

  def generate_sizes
    Size.create!(name: "Thumbnail" , dimension: "64x64", price: 10)
    Size.create!(name: "Small", dimension: "480x320", price: 15)
    Size.create!(name: "Medium", dimension: "960x640", price: 20)
    Size.create!(name: "Large", dimension: "1920x1280", price: 25)
    p "Made some sizes and junk."
  end

  def generate_platform_admin
    user = User.create!(username: "jorge@turing.io",
                        password: "password")
    user.roles << Role.find_by(name: "registered_user")
    user.roles << Role.find_by(name: "platform_admin")
  end

  def generate_business_admins
    20.times do |i|
      if i == 0
        business_admin = User.create!(username: "andrew@turing.io",
                                      password: "password",
                                      first_name: "andrew",
                                      last_name: "#{i}",
                                      email: "andrew#{i}@turing.com")
      else
        business_admin = User.create!(username: "andrew#{i}@turing.io",
                                      password: "password",
                                      first_name: "andrew#{i}",
                                      last_name: "#{i}",
                                      email: "andrew#{i}@turing.com")
      end
      business_admin.roles << Role.find_by(name: "registered_user")
      business_admin.roles << Role.find_by(name: "business_admin")
      business_admin.businesses << Business.find(i + 1)
     end
     me = User.create!(username: 'rossedfort', password: 'password', first_name: 'Ross', last_name: 'Edfort', email: 'rossedfort@yahoo.com')
     me.roles << Role.find_by(name: "business_admin")
     me.businesses << @business
   end

  def generate_businesses
    19.times do |i|
      business = Business.create!(name: FFaker::Company.name,
                                  location: FFaker::AddressUS.state,
                                  bio: FFaker::HipsterIpsum.phrase,
                                  status: "Online"
                                 )
      puts "#{i+1}: #{business.name} business created!"
    end
    @business = Business.create!(name: FFaker::Company.name,
                                location: FFaker::AddressUS.state,
                                bio: FFaker::HipsterIpsum.phrase
                               )
  end

  def generate_users
    100.times do
      generate_user
    end
  end

  def generate_roles
    roles = %w(registered_user business_admin platform_admin)
    roles.each do |role|
      Role.create(name: role)
    end
    p "Generated roles!!!!!!!! XD XD XD"
  end

  private

  def generate_user
    username = FFaker::Internet.user_name
    user = User.find_by(username: username)
    if user
      generate_user
    else
      user = User.create!(username: username,
                          password: FFaker::HipsterIpsum.word
                         )
      user.roles << Role.find_by(name: "registered_user")
      puts "#{user.username} with '#{user.password}' password created!"
    end
  end
end



Seed.start
