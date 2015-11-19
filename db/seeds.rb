city_3 = City.create(name: "Steamboat Springs",
                     image_path: "http://assets-s3.mensjournal.com/img/essential/cowboy-country/618_348_cowboy-country.jpg",
                     short_d: "One of the northernmost ski resorts in Colorado, Steamboat Springs lives up to its namesake with multiple glorious hot springs in the vicinity.",
                     long_d: "Originally a trapper's stomping ground, the single-family Crawford's moved into the area and were the sole inhabitants for years.  As people developed the area through ranching and mining, they decided to name the area 'Steamboat Springs' due to the gurgling sound that the local hot springs made.  In 1963, two men named Jim Temple and John Fetcher came in and developed Storm Mountain which has grown momentously into the resort that exists today.")

city_4 = City.create(name: "Golden",
                     image_path: "http://yourhub.denverpost.com/wp-content/uploads/2013/11/Golden-Colorado.jpg",
                     short_d: "'Where the West was Created' is Golden's motto and it lives up to it with its deep-seeded roots in the gold rush and its sprawling mesas.",
                     long_d: "Sitting just outside of Denver, Golden is a mecca for bike and trail running enthusiasts everywhere.  Take in the breathtaking mesas while being tucked into the Front Range mountains and shrouded with Colorful Colorado's wild flowers.  Golden takes claim to one of the original Gold Rush towns as well as the grave site for the infamous Buffalo Bill.  If you want to be able to rub shoulders with generations of local Coloradans, this is the place to be.")

city = City.create(name: "Vail",
                   image_path: "http://www.madcma.org/portals/mad/Vail%20Cascade.jpg",
                   short_d: "Self-named 'an experience like no other.'  The largest ski resort in the United States boasts endless mountain fun in every season.",
                   long_d: "Known for it's rolling back bowls that provides a ski experience unknown anywhere else in the state.  Started by former 10th Mountain Division soldiers from World War II, the town of Vail proudly incorporated the history of its brave founders. Don't be fooled by it's humble beginnings as Vail is known for its luxurious shopping, breathtaking Betty Ford Gardens, world class dining, and some of the friendliest locals around.")

city_2 = City.create(name: "Telluride",
                     image_path: "http://www.skinet.com/ski/files/_attachments_articles/telluridegondola_ic_2012.jpg",
                     short_d: "Nested in the San Juan Mountains, this fairytale mountain town will take you back to simpler times.",
                     long_d: "Telluride has somehow escaped the trend of becoming the traditional mountain resort, while retaining it's small town charm.  While the town might be a bit isolated, the twists and turns through the San Juan mountain range to get there will make it a ride you will never forget.  The town is a former silver mining camp on the San Miguel River where the first gold mining claim was made in the mountains above Telluride in 1875 and early settlement of what is now Telluride followed.")

Trip.create(name: "Race the Pass",
            city_id: city.id,
            status: 0,
            price: 100,
            description: "Reach new heights and speeds as you descend from 10,662ft through rolling mountains.",
            image_path: "http://i.imgur.com/fQU2MeM.jpg",
            info: "Reach new heights and speeds as you descend from 10,662ft through rolling mountains. Race the same path that the world famous US Pro Challenge professional cyclists participate in every August.  Either pretend you are competing or take a leisurely ride ending in the village at the original restaurant in Vail - Pepi's.  Relax while enjoying traditional German dishes and beer with some locally renowned musicians playing an intimate show.  Board the newest gondola, Gondola One, right before sunset to enjoy a peaceful walk down the mountain with some of the best views of town.")

Trip.create(name: "Leaf Peepers",
           city_id: city.id,
           status: 0,
           price: 100,
           description: "'Colorful Colorado' greets drivers at the state line for a reason- feast on the beauty of the colorful, quaking aspens on bike!",
           image_path: "https://s-media-cache-ak0.pinimg.com/736x/bd/22/84/bd228402904395734e0f8b9d12b69d86.jpg",
           info: "'Colorful Colorado' greets drivers at the state line for a reason! Feast on the beauty of the colorful, quaking aspens on bike! This extreme tour leads you through some of Vail's infamous mountain bike paths down mountain.  Challenge yourself by traversing up the mountain or enjoy the convenience of a bike haul to the top.  Once up there, we will enjoy a hearty lunch overlooking the rolling back bowls and start the steep trek down.  Get lost in the wonder of the yellows, reds, and oranges and enjoy the reward of a beer well deserved at the quintessential Garfinkel's backporch surrounded by locals alike.")


Trip.create(name: "Adrenaline Junkie",
            city_id: city_2.id,
            status: 0,
            price: 150,
            description: "Looking for a more extreme view of Telluride? We've got you covered.",
            image_path: "http://www.tellurideskiresort.com/content/uploaded/images/activities/mountain-biking-fmarmsater-1920x840-hero.jpg",
            info: "Looking for a more extreme view of Telluride?  Start the morning with a climb up to Bridal Veil Falls where breakfast catered by local restaurant Butcher and Baker will be waiting.  Next get ready to see the town of Telluride from the exhilarating Via Ferrata traverse.  Now climbing experience is necessary as our guides will provide all necessary gear.  Let your heart race as you see the entire town thousands of feet below you!  A bike ride through the windy streets of Telluride will end with lunch at the local's favorite, Brown Dog Pizza.  End the day with a smooth bike ride out to the renowned Telluride Brewery for a sampling of some of the finest beers in the state!")

Trip.create(name: "Telluride Trek",
            city_id: city_2.id,
            status: 0,
            price: 125,
            description: "Ride through the heart of Telluride while rubbing shoulders with the locals.",
            image_path: "http://www.grandparkco.com/wp-content/uploads/2015/03/downtown-telluride-summer.jpg",
            info: "A great trip for first time visitors who are really looking to get to know every end of the town, the trip starts with a  hike up Telluride Mountain for a picnic lunch.  Explore the grassy ski runs and as a reward for a good hike, a ride down the free gondola into Mountain Village will be awaiting.  Rental bikes will be stationed at the base for a quick tour around the ski village of the town.  Enjoy a refreshing Moscow mule and snack pairings from local restaurants while rubbing shoulders with the townsfolk. Enjoy a panoramic view of the valley while taking the full gondola ride down back to the town.  A bike ride through the winding streets will end at the local brewery with food pairings.")


Trip.create(name: "Red Dirt Loop",
            city_id: city_3.id,
            status: 0,
            price: 125,
            description: "Get ready for a day of adventure along Route 40's most beautiful resort.",
            image_path: "http://www.mtbproject.com/photos/mtb/36/26/5663626_smallMed_7b19ac1404064266.jpg",
            info: "Get ready for a day of adventure by meeting in the village at Creekside Cafe & Grill for a local's favorite breakfast - we recommend the egg's benedict!  A ride up to the Mad Creek/Red Dirt Loop trail head will start the 10.2 mile adventure through some less seen parts of the famous town.  This trail is not for the weak of heart as there is a 5% grade and a 1,300 ft ascent throughout the entire trail. Don't worry as there will be a break along Mad Creek for local snacks from town and a chance to wander around the trails.  After the long ride, an early dinner will be served at Sun Pie Bistro while enjoying some craft Colorado beers on the porch overlooking the river.  A shuttle will be provided to escort the trip to Strawberry Park Hot Springs to rest the weary!")

Trip.create(name: "The Steamboat Mosey",
            city_id: city_3.id,
            status: 0,
            price: 100,
            description: "For those looking to kick back and relax, this trip will define mountain living at its best.",
            image_path: "http://www.destinationcolorado.com/images/sized/assets/uploads/venues/steamboat2-560x375.jpg",
            info: "For those looking to kick back and relax, this trip will start at Creekside Cafe & Grill for brunch and a mimosa.  From the Gondola Transit Center, the trip will hop on the Mt. Werner Trail. This paved path will provide spectacular views of the town while keeping altitude sickness at ease!  Enjoy a local's favorite spot, The Rusted Porch, while settling into cozy booths for some Colorado comfort food and craft brews.  Rub elbows with townsfolk and maybe meet a 'lifer' while you mingle with the locals!")

Trip.create(name: "Mosey Around the Mesas",
            city_id: city_4.id,
            status: 0,
            price: 80,
            description: "Enjoy exploring the city where the gold rush began on bike!",
            image_path: "http://43mbhp3aft5g3uc0tuhsk4a8.wpengine.netdna-cdn.com/wp-content/uploads/2014/04/table-mountain-header.jpg",
            info: "Eat a big breakfast, because this trip is not for the faint of heart. Climb the North Table Mountain Mesa up over 1,000 feet to the top of the flat mesa.  From there enjoy a picnic lunch from local spot, D'Deli and check out the best views of downtown Denver.  Now comes the fun part - follow the guide down the mesa as you reach top speeds descending into town.  As a cool off, a quick mosey through the historic town with a mini history lesson from the guide as well as some locals if we're lucky will accompany.  End a great heart-pumping adventure at the local Mountain Toad Brewery for a sit by the fire with a world class IPA.")

Trip.create(name: "The Golden Gait",
            city_id: city_4.id,
            status: 0,
            price: 80,
            description: "Enjoy exploring the city where the gold rush began on bike!",
            image_path: "http://www.coloradomuseums.org/wordpress/wp-content/uploads/2012/10/Downtown-Golden-with-arch.jpg",
            info: "Meet in the downtown Golden park to pick up your bike and meet the crew! From  there the tour will wind through the historic streets of Golden with tales of its gold mining past.  After an 1.5 hour ride, end at the Sherpa House which has been a local’s favorite for years.  Enjoy authentic cuisine as well as a waltz around the restaurant which is located in a re purposed house.  End the day with a quick mosey down the Jackson Street Corridor.  For those looking to quench their thirst after a long day of cycling, a beer at the renowned Mountain Toad Brewery awaits!")

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
