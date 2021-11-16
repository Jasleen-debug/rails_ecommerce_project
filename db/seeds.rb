NUMBER_OF_FOOD_CATEGORIES = 5
DISHES_PER_CATEGORY = 10

FoodItem.destroy_all
FoodCategory.destroy_all

NUMBER_OF_FOOD_CATEGORIES.times do
  food_category = FoodCategory.create(name: Faker::Food.unique.ethnic_category)

  DISHES_PER_CATEGORY.times do
    food_item = food_category.food_items.create(
      name:        Faker::Food.unique.dish,
      description: Faker::Food.description,
      price:       1.2 * rand(5..30)
    )

    # query = URI.encode_www_form_component([food_item.name, food_category.name].join(","))
    # downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
    # food_item.image.attach(io:       downloaded_image,
    #                        filename: "m-#{[food_item.name,
    #                                        food_category.name].join('-')}.jpg")
    # sleep(1)
  end
end

coffee = FoodCategory.create(name: "Beverages - Coffee")
10.times do
  food_item = coffee.food_items.create(
    name:        Faker::Coffee.unique.blend_name,
    description: Faker::Coffee.notes,
    price:       1.2 * rand(1..10)
  )
  # query = URI.encode_www_form_component([food_item.name, food_category.name].join(","))
  # downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
  # food_item.image.attach(io:       downloaded_image,
  #                        filename: "m-#{[food_item.name,
  #                                        food_category.name].join('-')}.jpg")
  # sleep(1)
end

tea = FoodCategory.create(name: "Beverages - Tea")
10.times do
  food_item = tea.food_items.create(
    name:        Faker::Tea.unique.variety,
    description: Faker::Tea.type,
    price:       1.2 * rand(1..10)
  )
  # query = URI.encode_www_form_component([food_item.name, food_category.name].join(","))
  # downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
  # food_item.image.attach(io:       downloaded_image,
  #                        filename: "m-#{[food_item.name,
  #                                        food_category.name].join('-')}.jpg")
  # sleep(1)
end

beer = FoodCategory.create(name: "Beverages - Beer")
20.times do
  food_item = beer.food_items.create(
    name:        Faker::Beer.unique.name,
    description: "This #{Faker::Beer.style} style beer has #{Faker::Beer.alcohol} alcohol,
                  it contains a hint of #{Faker::Beer.malts} and #{Faker::Beer.yeast}.",
    price:       0.2 * rand(10..20)
  )

  # query = URI.encode_www_form_component([food_item.name, food_category.name].join(","))
  # downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
  # food_item.image.attach(io:       downloaded_image,
  #                        filename: "m-#{[food_item.name,
  #                                        food_category.name].join('-')}.jpg")
  # sleep(1)
end

dessert = FoodCategory.create(name: "Desserts")
10.times do
  food_item = dessert.food_items.create(
    name:        Faker::Dessert.unique.variety,
    description: "It is topped with #{Faker::Dessert.topping} and contains #{Faker::Dessert.flavor}",
    price:       0.3 * rand(5..15)
  )
  # query = URI.encode_www_form_component([food_item.name, food_category.name].join(","))
  # downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
  # food_item.image.attach(io:       downloaded_image,
  #                        filename: "m-#{[food_item.name,
  #                                        food_category.name].join('-')}.jpg")
  # sleep(1)
end

puts "Created #{FoodCategory.count} Food categories."
puts "Created #{FoodItem.count} Food items."

# if Rails.env.development?
#   AdminUser.create!(email: "admin@example.com", password: "password",
#                     password_confirmation: "password")
# end
