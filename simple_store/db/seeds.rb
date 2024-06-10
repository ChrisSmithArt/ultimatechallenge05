# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

# 676.times do
#   Product.create(
#     title: "#{Faker::Ancient.primordial} #{Faker::Food.ingredient}",
#     price: Faker::Commerce.price,
#     stock_quantity: Faker::Number.between(from: 1, to: 10)
#   )
# end
require "csv"

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)
products = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

products.each do |product|
  category_name = product['category']
  category = Category.find_or_create_by(name: category_name)

  Product.create(
    title: product['name'],
    price: product['price'],
    description: product['description'],
    stock_quantity: product['stock_quantity'],
    category: category
  )
end
