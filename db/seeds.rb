city = City.create(name: "Vail",
                   image_path: "http://thetravelkitblog.files.wordpress.com/2014/01/vail-village.jpg")

city = City.create(name: "Telluride",
                  image_path: "http://www.momsformomscommunities.com/wp-content/uploads/2011/05/telluride-town-center.jpg")

city.trips.create(name: "Race the Pass",
                  price: 100,
                  description: "Reach new heights and speeds as you descend from 10,662ft through rolling mountains.",
                  image_path: "http://www.mtbproject.com/photos/mtb/52/49/5725249_smallMed_604a011404786951.jpg")

city.trips.create(name: "Race the Pass",
                  price: 100,
                  description: "Reach new heights and speeds as you descend from 10,662ft through rolling mountains.",
                  image_path: "http://www.mtbproject.com/photos/mtb/52/49/5725249_smallMed_604a011404786951.jpg")

city.trips.create(name: "Race the Pass",
                  price: 100,
                  description: "Reach new heights and speeds as you descend from 10,662ft through rolling mountains.",
                  image_path: "http://www.mtbproject.com/photos/mtb/52/49/5725249_smallMed_604a011404786951.jpg")

user = User.create(username: "Jill", password: "password")
