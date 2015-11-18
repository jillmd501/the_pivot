city = City.create(name: "Vail",
                   image_path: "http://thetravelkitblog.files.wordpress.com/2014/01/vail-village.jpg",
                   short_d: "Self-named 'an experience like no other.'  The largest ski resort in the United States boasts endless mountain fun in every season.",
                   long_d: "Known for it's rolling back bowls that provides a ski experience unknown anywhere else in the state.  Started by former 10th Mountain Division soldiers from World War II, the town of Vail proudly incorporated the history of its brave founders. Don't be fooled by it's humble beginnings as Vail is known for its luxurious shopping, breathtaking Betty Ford Gardens, world class dining, and some of the friendliest locals around.")

city_2 = City.create(name: "Telluride",
                     image_path: "http://www.momsformomscommunities.com/wp-content/uploads/2011/05/telluride-town-center.jpg",
                     short_d: "Nested in the San Juan Mountains, this fairytale mountain town will take you back to simpler times.",
                     long_d: "Telluride has somehow escaped the trend of becoming the traditional mountain resort, while retaining it's small town charm.  While the town might be a bit isolated, the twists and turns through the San Juan mountain range to get there will make it a ride you will never forget.  The town is a former silver mining camp on the San Miguel River where the first gold mining claim was made in the mountains above Telluride in 1875 and early settlement of what is now Telluride followed.  Enjoy the traditional historic town or take the free gondola up and over to the Mountain Village Ski Resort.  Enjoy cruising the main street for some shopping and local bars or make the trek up to the famous Bridal Veil Falls at sunset to see the best view of town.")

city_3 = City.create(name: "Steamboat Springs",
                     image_path: "http://www.findyourspot.com/sites/all/images/fys/city/photos/Steamboat-Springs-Colorado-1_photo.jpg",
                     short_d: "One of the northernmost ski resorts in Colorado, Steamboat Springs lives up to its namesake with multiple glorious hot springs in the vicinity.",
                     long_d: "Originally a trapper's stomping ground, the single-family Crawford's moved into the area and were the sole inhabitants for years.  As people developed the area through ranching and mining, they decided to name the area 'Steamboat Springs' due to the gurgling sound that the local hot springs made.  In 1963, two men named Jim Temple and John Fetcher came in and developed Storm Mountain which has grown momentously into the resort that exists today.")

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
                  image_path: "http://www.grandparkco.com/wp-content/uploads/2015/03/downtown-telluride-summer.jpg")

city_2.trips.create(name: "Adrenaline Junkie",
                  price: 150,
                  description: "Looking for a more extreme view of Telluride? We've got you covered.",
                  image_path: "http://extras.mnginteractive.com/live/media/site36/2010/0513/20100513__20100516_T09_TR16TELLURIDE~p1.JPG")

city_3.trips.create(name: "Red Dirt Loop",
                  price: 90,
                  description: "Get ready for a day of adventure along Route 40's most beuatiful resort.",
                  image_path: "http://www.mtbproject.com/photos/mtb/36/26/5663626_smallMed_7b19ac1404064266.jpg")

city_3.trips.create(name: "The Steamboat Mosey",
                  price: 75,
                  description: "For those looking to kick back and relax, this trip will define mountain living at its best.",
                  image_path: "http://www.destinationcolorado.com/images/sized/assets/uploads/venues/steamboat2-560x375.jpg")

User.create(username: "Jill",
            password: "password",
            first_name: "Jill",
            last_name: "Donohue",
            address: "1510 Blake St",
            city: "Denver",
            state: "CO",
            zip: 80202)

User.create(username: "admin",
            password: "password",
            role: 1,
            address: "1510 Blake St",
            city: "Denver",
            state: "CO",
            zip: 80202)
