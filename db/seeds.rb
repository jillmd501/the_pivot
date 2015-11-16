city = City.create(name: "Vail",
                   image_path: "http://thetravelkitblog.files.wordpress.com/2014/01/vail-village.jpg")

city_2 = City.create(name: "Telluride",
                  image_path: "http://www.momsformomscommunities.com/wp-content/uploads/2011/05/telluride-town-center.jpg")

city_3 = City.create(name: "Steamboat Springs",
                  image_path: "http://www.findyourspot.com/sites/all/images/fys/city/photos/Steamboat-Springs-Colorado-1_photo.jpg")

city.trips.create(name: "Race the Pass",
                  price: 100,
                  description: "Reach new heights and speeds as you descend from 10,662ft through rolling mountains.",
                  image_path: "http://www.mtbproject.com/photos/mtb/52/49/5725249_smallMed_604a011404786951.jpg")

city.trips.create(name: "Leaf Peepers",
                  price: 75,
                  description: "'Colorful Colorado' greets drivers at the state line for a reason- feast on the beauty of the colorful, quaking aspens on bike!",
                  image_path: "https://s-media-cache-ak0.pinimg.com/736x/bd/22/84/bd228402904395734e0f8b9d12b69d86.jpg")

city_2.trips.create(name: "Telluride Trek",
                  price: 125,
                  description: "Ride through the heart of Telluride whle rubbing shoulders with the locals.",
                  image_path: "https://www.google.com/search?q=telluride+gondola&espv=2&biw=1280&bih=701&source=lnms&tbm=isch&sa=X&ved=0CAcQ_AUoAmoVChMIgJeI-fyIyQIVEPZjCh3s3QsK#tbm=isch&q=telluride+gondola+summer&imgrc=wJKdKI0HNb3kAM%3A")

city_2.trips.create(name: "Adrenaline Junkie",
                  price: 150,
                  description: "Looking for a more extreme view of Telluride? We've got you covered.",
                  image_path: "https://www.google.com/search?q=telluride+gondola&espv=2&biw=1280&bih=701&source=lnms&tbm=isch&sa=X&ved=0CAcQ_AUoAmoVChMIgJeI-fyIyQIVEPZjCh3s3QsK#tbm=isch&q=telluride+gondola+summer&imgrc=wJKdKI0HNb3kAM%3A")

city_3.trips.create(name: "Red Dirt Loop",
                  price: 90,
                  description: "Get ready for a day of adventure along Route 40's most beuatiful resort.",
                  image_path: "http://www.mtbproject.com/photos/mtb/36/26/5663626_smallMed_7b19ac1404064266.jpg")

city_3.trips.create(name: "The Steamboat Mosey",
                  price: 75,
                  description: "For those looking to kick back and relax, this trip will define mountain living at its best.",
                  image_path: "http://www.destinationcolorado.com/images/sized/assets/uploads/venues/steamboat2-560x375.jpg")

user = User.create(username: "Jill", password: "password")
