city = City.create(name: 'Vail', image_path: 'image.jpg')
city.categories.create(name: 'Entertainment')
city.categories.create(name: 'Food & Drink')
city.categories.first.options.create(name: 'Snowshoeing',
                                     description: 'So fun!',
                                     price: 75)
city.categories.first.options.create(name: 'Skiing',
                                     description: 'Love it!',
                                     price: 100)
city.categories.last.options.create(name: 'Brewery Tour',
                                    description: 'Mmm, Beer!',
                                    price: 20)
city.categories.last.options.create(name: 'Traveling Dinner',
                                    description: 'Restaurant hopping!',
                                    price: 40)


city = City.create(name: 'Golden', image_path: 'image.jpg')
city.categories.create(name: 'Entertainment')
city.categories.create(name: 'Food & Drink')
city.categories.first.options.create(name: 'Mountain Biking',
                                    description: 'Woohoo!',
                                    price: 30)
city.categories.first.options.create(name: 'Trail Running',
                                    description: 'Yessss!',
                                    price: 20)
city.categories.last.options.create(name: 'Coors Brewery Tour',
                                    description: 'Mmm, Beer!',
                                    price: 20)
city.categories.last.options.create(name: 'Saloon Show',
                                    description: 'Wild West Action!',
                                    price: 40)
