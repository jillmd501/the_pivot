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
    Photo.create!(name: "Couple on Bench", price: 10, description: "A nice shot of a man and women sitting on a bench accross from a lake", business_id: 1, image_file_name: "photo_1", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Couple on Bridge", price: 8, description: "A couple on a bridge at sunset", business_id: 1, image_file_name: "photo_2", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Personwearing Beanie", price: 9, description: "An ambiguous form wearing a warm coat and beainie on a foggy winter day", business_id: 1, image_file_name: "photo_3", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Red-haired Woman Reacts", price: 12, description: "A red-haired woman, possibly in a business meeting, reacts joyously", business_id: 1, image_file_name: "photo_4", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Eyes", price: 10, description: "A beautiful black & white photo of a man peering eerily over his computer screen", business_id: 1, image_file_name: "photo_5", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Tunnel Vision", price: 8, description: "A trio stand at the end of a tunnel, silhouetted by the light in the background", business_id: 1, image_file_name: "photo_6", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Man on the Beach", price: 7, description: "A man stands near the shore at sunset", business_id: 1, image_file_name: "photo_7", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Fall Day", price: 6, description: "A man stands in the forest with the sun shining through the fall foliage", business_id: 1, image_file_name: "photo_8", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Woman at the Beach", price: 9, description: "A dark haired woman stands on the beach at dusk", business_id: 1, image_file_name: "photo_9", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Train Station", price: 9, description: "A woman looks away as a the train whizzes by", business_id: 1, image_file_name: "photo_10", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Hooded Figure", price: 8, description: "Somebody in a jacket standing in the forest", business_id: 1, image_file_name: "photo_11", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Yellow Hat", price: 10, description: "A man on a bench looks over the bay in winter", business_id: 1, image_file_name: "photo_12", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
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
