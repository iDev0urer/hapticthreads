# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Customer.delete_all
OrderItem.delete_all
Order.delete_all
Product.delete_all
Category.delete_all

Customer.create! id: 1, email: 'test@example.com', password: 'Pi31415926'

Category.create! id: 1, name: 'shirt', slug: 'shirts', is_sub: false
Category.create! id: 2, name: 'pant', slug: 'pants', is_sub: false
Category.create! id: 3, name: 'dress', slug: 'dresses', is_sub: false

Product.create! id: 1, name: 'Sample shirt', slug: 'sample-shirt', category_id: 1, description: 'Lorem ipsum delor sit amet', size: 'M', price: 14.99, on_sale: false
Product.create! id: 2, name: 'Sample pants', slug: 'sample-pants', category_id: 2, description: 'Lorem ipsum delor sit amet', size: '32x34', price: 12.99, on_sale: false
Product.create! id: 3, name: 'Sample dress', slug: 'sample-dress', category_id: 3, description: 'Lorem ipsum delor sit amet', size: 'S', price: 22.00, sale_price: 16.95, on_sale: true

Order.create! id: 1, customer_id: 1, subtotal: 44.93, tax: 2.92, total: 47.85

OrderItem.create! product_id: 1, order_id: 1
OrderItem.create! product_id: 2, order_id: 1
OrderItem.create! product_id: 3, order_id: 1