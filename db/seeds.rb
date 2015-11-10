city = City.create(name: "Vail",
                   image_path: "https://images.unsplash.com/photo-1414170695976-59c0463bd11d?ixlib=rb-0.3.5&q=80&fm=jpg&s=288a040649461637ba34d7398ff0e065")
city.categories.create(name: "Entertainment")
city.categories.create(name: "Food & Drink")
city.categories.first.options.create(name: "Snowshoeing",
                                     description: "So fun!",
                                     price: 75)
city.categories.first.options.create(name: "Skiing",
                                     description: "Love it!",
                                     price: 100)
city.categories.last.options.create(name: "Brewery Tour",
                                    description: "Mmm, Beer!",
                                    price: 20)
city.categories.last.options.create(name: "Traveling Dinner",
                                    description: "Restaurant hopping!",
                                    price: 40)


city = City.create(name: "Golden",
                   image_path: "https://images.unsplash.com/photo-1423450822265-fcd97e52ecb5?ixlib=rb-0.3.5&q=80&fm=jpg&s=b4e113de22023f00f2d8aa1b3de11492")
city.categories.create(name: "Entertainment")
city.categories.create(name: "Food & Drink")
city.categories.first.options.create(name: "Mountain Biking",
                                    description: "Woohoo!",
                                    price: 30)
city.categories.first.options.create(name: "Trail Running",
                                    description: "Yessss!",
                                    price: 20)
city.categories.last.options.create(name: "Coors Brewery Tour",
                                    description: "Mmm, Beer!",
                                    price: 20)
city.categories.last.options.create(name: "Saloon Show",
                                    description: "Wild West Action!",
                                    price: 40)
