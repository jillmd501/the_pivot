require 'time'

class Seed
  def self.start
    seed = Seed.new
    seed.generate_platform_admin
    seed.generate_businesses
    seed.generate_users
    # seed.generate_photos
    seed.generate_sizes
    # seed.generate_business_admins
  end

  def generate_sizes
    sizes = {"Thumbnail" => 10, "Small" => 15, "Medium" => 20, "Large" => 25}
    sizes.each do |size, price|
      Size.create!(name: size, price: price)
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
    200.times do |i|
      photo = Photo.create(name: FFaker::Name.first_name,
                           description: FFaker::HipsterIpsum.phrase,
                           business_id: rand(1..20)
                           )
      puts "#{i}: #{photo.name} photo created!"

    Photo.create!(name: "Couple on a Bench", price: 10, description: "A nice shot of a man and women sitting on a bench accross from a lake", business_id: 1, image_file_name: "photo_1", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Couple on a Bridge", price: 8, description: "A couple on a bridge at sunset", business_id: 1, image_file_name: "photo_2", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Foggy Day", price: 9, description: "An ambiguous form wearing a warm coat and beainie on a foggy winter day", business_id: 1, image_file_name: "photo_3", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Joyful Reaction", price: 12, description: "A red-haired woman, possibly in a business meeting, reacts joyously", business_id: 4, image_file_name: "photo_4", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Eyes", price: 10, description: "A beautiful black & white photo of a man peering eerily over his computer screen", business_id: 5, image_file_name: "photo_5", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Tunnel Vision", price: 8, description: "A trio stand at the end of a tunnel, silhouetted by the light in the background", business_id: 6, image_file_name: "photo_6", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Man on the Beach", price: 7, description: "A man stands near the shore at sunset", business_id: 7, image_file_name: "photo_7", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Fall Day", price: 6, description: "A man stands in the forest with the sun shining through the fall foliage", business_id: 7, image_file_name: "photo_8", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Woman at the Beach", price: 9, description: "A dark haired woman stands on the beach at dusk", business_id: 9, image_file_name: "photo_9", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Train Station", price: 9, description: "A woman looks away as a the train whizzes by", business_id: 10, image_file_name: "photo_10", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Hooded Figure", price: 8, description: "Somebody in a jacket standing in the forest", business_id: 10, image_file_name: "photo_11", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Yellow Hat", price: 10, description: "A man on a bench looks over the bay in winter", business_id: 10, image_file_name: "photo_12", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Cigarette Break", price: 12, description: "A man on a bench smokes a cigarette in the cold", business_id: 13, image_file_name: "photo_13", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Waiting", price: 14, description: "A woman in heels sits patiently at the bus stop", business_id: 15, image_file_name: "photo_14", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Night Lights", price: 6, description: "A man on a cliff overlooks a winding river at night", business_id: 15, image_file_name: "photo_15", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Vintage City", price: 7, description: "A man on sits on a ledge looking across the lake to the skyline in the distance", business_id: 16, image_file_name: "photo_16", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Glowing", price: 8, description: "A woman walks in the forest, her hair glowing in the evening sun", business_id: 17, image_file_name: "photo_17", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Walking", price: 12, description: "A man walks along a narrow natural path through a meadow of tall grass", business_id: 17, image_file_name: "photo_18", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Eyes", price: 14, description: "A child's eyes are iluuminated by a dim light", business_id: 19, image_file_name: "photo_19", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
    Photo.create!(name: "Hit Me", price: 12, description: "A man stands ominously hooded in a street, as if asking to be hit by the taxi", business_id: 20, image_file_name: "photo_20", image_content_type: "image/jpg", image_file_size: 2, image_updated_at: Time.now)
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
