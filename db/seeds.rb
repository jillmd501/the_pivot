city = City.create(name: "Vail",
                   image_path: "https://images.unsplash.com/photo-1414170695976-59c0463bd11d?ixlib=rb-0.3.5&q=80&fm=jpg&s=288a040649461637ba34d7398ff0e065")

city.trips.create(name: "Outdoor fun",
                  price: 100,
                  description: "biking",
                  image_path: "https://images.unsplash.com/photo-1446057633965-55d2dcb22598?ixlib=rb-0.3.5&q=80&fm=jpg&s=e3707c21e8df35e6d1b882c90b3b0fb3")

user = User.create(username: "Jill",
                   password: "password")

admin = User.create(username: "admin",
                    password: "password",
                    role: 1)
