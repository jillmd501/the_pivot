city = City.create(name: "Vail",
                   image_path: "http://thetravelkitblog.files.wordpress.com/2014/01/vail-village.jpg",
                   short_d: "Self-named 'an experience like no other.'  The largest ski resort in the United States boasts endless mountain fun in every season.",
                   long_d: "Known for it's rolling back bowls that provides a ski experience unknown anywhere else in the state.  Started by former 10th Mountain Division soldiers from World War II, the town of Vail proudly incorporated the history of its brave founders. Don't be fooled by it's humble beginnings as Vail is known for its luxurious shopping, breathtaking Betty Ford Gardens, world class dining, and some of the friendliest locals around.")

city_2 = City.create(name: "Telluride",
                     image_path: "http://www.momsformomscommunities.com/wp-content/uploads/2011/05/telluride-town-center.jpg",
                     short_d: "Nested in the San Juan Mountains, this fairytale mountain town will take you back to simpler times.",
                     long_d: "Telluride has somehow escaped the trend of becoming the traditional mountain resort, while retaining it's small town charm.  While the town might be a bit isolated, the twists and turns through the San Juan mountain range to get there will make it a ride you will never forget.  The town is a former silver mining camp on the San Miguel River where the first gold mining claim was made in the mountains above Telluride in 1875 and early settlement of what is now Telluride followed.")

city_3 = City.create(name: "Steamboat Springs",
                     image_path: "http://yourhub.denverpost.com/wp-content/uploads/2013/11/Golden-Colorado.jpg",
                     short_d: "One of the northernmost ski resorts in Colorado, Steamboat Springs lives up to its namesake with multiple glorious hot springs in the vicinity.",
                     long_d: "Originally a trapper's stomping ground, the single-family Crawford's moved into the area and were the sole inhabitants for years.  As people developed the area through ranching and mining, they decided to name the area 'Steamboat Springs' due to the gurgling sound that the local hot springs made.  In 1963, two men named Jim Temple and John Fetcher came in and developed Storm Mountain which has grown momentously into the resort that exists today.")

city_3 = City.create(name: "Golden",
                     image_path: "http://www.findyourspot.com/sites/all/images/fys/city/photos/Steamboat-Springs-Colorado-1_photo.jpg",
                     short_d: "'Where the West was Created' is Golden's motto and it lives up to it with its deep-seeded roots in the gold rush and its sprawling mesas.",
                     long_d: "Sitting just outside of Denver, Golden is a mecca for bike and trailrunning enthusiasts everywhere.  Take in the breathtaking mesas while being tucked into the Front Range mountains and shrouded with Colorful Colorado's wild flowers.  Golden takes claim to one of the original Gold Rush towns as well as the gravesite for the infamous Buffalo Bill.  If you want to be able to rub shoulders with generations of local Coloradans, this is the place to be.")

city.trips.create(name: "Race the Pass",
                  price: 100,
                  description: "Reach new heights and speeds as you descend from 10,662ft through rolling mountains.",
                  image_path: "http://www.mtbproject.com/photos/mtb/52/49/5725249_smallMed_604a011404786951.jpg",
                  info: "Reach new heights and speeds as you descend from 10,662ft through rolling mountains. Race the same path that the world famous US Pro Challenge professional cyclists participate in every August.  Either
                        pretend you are competing or take a leisurely ride ending in the village at the original restaurant in Vail - Pepi's.  Relax while enjoying traditional German dishes and beer with some locally renowned
                        musicians playing an intimate show.  Board the newest gondola, Gondola One, right before sunset to enjoy a peaceful walk down the mountain with some of the best views of town.")

city.trips.create(name: "Leaf Peepers",
                  price: 75,
                  description: "'Colorful Colorado' greets drivers at the state line for a reason- feast on the beauty of the colorful, quaking aspens on bike!",
                  image_path: "https://s-media-cache-ak0.pinimg.com/736x/bd/22/84/bd228402904395734e0f8b9d12b69d86.jpg",
                  info: "'Colorful Colorado' greets drivers at the state line for a reason! Feast on the beauty of the colorful, quaking aspens on bike! This extreme tour leads you through some of Vail's infamous
                          mountain bike paths down mountain.  Challenge yourself by traversing up the mountain or enjoy the convenience of a bike haul to the top.  Once up there, we will enjoy a hearty lunch overlooking the
                          rolling back bowls and start the steep trek down.  Get lost in the wonder of the yellows, reds, and oranges and enjoy the reward of a beer well deserved at the quintessential Garfinkel's backporch
                          surrounded by locals alike.")

city_2.trips.create(name: "Telluride Trek",
                  price: 125,
                  description: "Ride through the heart of Telluride whle rubbing shoulders with the locals.",
                  image_path: "http://www.grandparkco.com/wp-content/uploads/2015/03/downtown-telluride-summer.jpg",
                  info: "A great trip for first time visitors who are really looking to get to know every end of the town, the trip starts with a  hike up Telluride Mountain for a picnic lunch.  Explore the grassy ski
                        runs and as a reward for a good hike, a ride down the free gondola into Mountain Village will be awaiting.  Rental bikes will be stationed at the base for a quick tour around the ski village of
                        the town.  Enjoy a refreshing moscow mule and snack pairings from local restaurants while rubbing shoulders with the townsfolk. Enjoy a panoramic view of the valley while taking the full gondola
                        ride down back to the town.  A bike ride through the winding streets will end at the local brewery with food pairings.")

city_2.trips.create(name: "Adrenaline Junkie",
                  price: 150,
                  description: "Looking for a more extreme view of Telluride? We've got you covered.",
                  image_path: "http://extras.mnginteractive.com/live/media/site36/2010/0513/20100513__20100516_T09_TR16TELLURIDE~p1.JPG",
                  info: "Looking for a more extreme view of Telluride?  Start the morning with a climb up to Bridal Veil Falls where breakfast catered by local restaurant Butcher and Baker will be waiting.  Next get ready
                  to see the town of Telluride from the exhilirating Via Ferrata traverse.  Now climbing experience is necessary as our guides will provide all necessary gear.  Let your heart race as you see the entire town
                  thousands of feet below you!  A bike ride through the windy streets of Telluride will end with lunch at the local's favorite, Brown Dog Pizza.  End the day with a smooth bike ride out to the renowned Telluride
                  Brewery for a sampling of some of the finest beers in the state!")

city_3.trips.create(name: "Red Dirt Loop",
                  price: 90,
                  description: "Get ready for a day of adventure along Route 40's most beautiful resort.",
                  image_path: "http://www.mtbproject.com/photos/mtb/36/26/5663626_smallMed_7b19ac1404064266.jpg",
                  info: "Get ready for a day of adventure by meeting in the village at Creekside Cafe & Grill for a local's favorite breakfast - we recommend the egg's benedict!  A ride up to the Mad Creek/Red Dirt Loop trailhead
                        will start the 10.2 mile adventure through some less seen parts of the famous town.  This trail is not for the weak of heart as there is a 5% grade and a 1,300 ft ascent throughout the entire trail. Don't worry
                        as there will be a break along Mad Creek for local snacks from town and a chance to wander around the trails.  After the long ride, an early dinner will be served at Sun Pie Bistro while enjoying some craft Colorado
                        beers on the porch overlooking the river.  A shuttle will be provided to escort the trip to Strawberry Park Hot Springs to rest the weary!")

city_3.trips.create(name: "The Steamboat Mosey",
                  price: 75,
                  description: "For those looking to kick back and relax, this trip will define mountain living at its best.",
                  image_path: "http://www.destinationcolorado.com/images/sized/assets/uploads/venues/steamboat2-560x375.jpg",
                  info: "For those looking to kick back and relax, this trip will start at Creekside Cafe & Grill for brunch and a mimosa.  From the Gondola Transit Center, the trip will hop on the Mt. Werner Trail. This paved path
                        will provide spectacular views of the town while keeping altitude sickness at ease!  Enjoy a local's favorite spot, The Rusted Porch, while settling into cozy booths for some Colorado comfort food and craft brews.
                        Rub elbows with townsfolk and maybe meet a 'lifer' while you mingle with the locals!")

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
