# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all
Review.destroy_all

puts "Creating users..."
user1 = User.create(name: Faker::Name.name)
user2 = User.create(name: Faker::Name.name)
user3 = User.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating reviews..."
# *****************************************************************
# * TODO: create reviews! Remember, a review belongs to a product *
# * and a review belongs to an user.                              *
# *****************************************************************
# Create Reviews Here


positive_review = Review.create(star_rating: 5, comment: "Great product!", product_id: product1.id, user_id: user1.id)
negative_review = Review.create(star_rating: 1, comment: "Terribly made!", product_id: product2.id, user_id: user1.id)
mediocre_review = Review.create(star_rating: 3, comment: "Worked okay...", product_id: product3.id, user_id: user1.id)



puts "Seeding done!"
puts

puts positive_review.star_rating
puts negative_review.product.price
puts mediocre_review.user.name

puts
puts "print review"
puts positive_review.print_review
puts

puts "leave review"
last_review = product1.leave_review(user1, 2, "meh")
puts last_review.product.price

puts
puts "all reviews"
puts product1.print_all_reviews
puts

puts "average rating"
puts product1.average_rating


# puts "fav product"
# puts user1.favorite_product

# puts
# puts "remove reviews"
# user1.remove_reviews(product1)
# puts


