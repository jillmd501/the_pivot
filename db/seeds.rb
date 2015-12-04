require 'time'

class Seed
  def self.start
    seed = Seed.new
    seed.generate_platform_admin
    seed.generate_businesses
    seed.generate_users
    seed.generate_photos
    seed.generate_sizes
    # seed.generate_business_admins
  end

  def generate_sizes
    sizes = %w(Thumbnail Small Medium Large)
    sizes.each do |size|
      Size.create!(name: size)
    end
  end

  def generate_platform_admin
    User.create!(username: "jorge@turing.io",
                 password: "password",
                 role: 2)
  end

  # def generate_business_admins
  #   20.times do |i|
  #     business_admin = User.create!(username: "andrew@turing.io",
  #                                    password: "password",
  #                                    role: 1)
  #
  #    end
  #  end

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
    100.times do
      generate_user
    end
  end

  def generate_photos
    Photo.create!(name: "Couple on bench", price: 10, description: "A nice shot of a man and women sitting on a bench accross from a lake", business_id: 1, image_file_name: "photo_1", image_content_type: "image/jpg", image_file_size: 8.11, image_updated_at: Time.now)
  end

  private

  def generate_user
    username = FFaker::Internet.user_name
    user = User.find_by(username: username)
    if user
      generate_user
    else
      user = User.create!(username: username,
                   password: FFaker::HipsterIpsum.word,
                   role: 0
                   )
      puts "#{user.username} with '#{user.password}' password created!"
    end
  end
end

Seed.start
