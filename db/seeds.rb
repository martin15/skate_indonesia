# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_or_create_by(email: "martin.me15@yahoo.com") do |user|
  user.name = "Martin"
  user.password_digest = BCrypt::Password.create('1q2w3e4r5t').to_s
end
puts user.inspect

greeting = Page.find_or_create_by(name: "greeting-1") do |page|
  page.title = "greeting-1"
  page.content = "greeting-1"
end
puts greeting.inspect

home1 = Page.find_or_create_by(name: "home-1") do |page|
  page.title = "home-1"
  page.content = "home-1"
end
puts home1.inspect

tenant_header = Page.find_or_create_by(name: "tenant-header") do |page|
  page.title = "tenant-header"
  page.content = "tenant-header-content"
end
puts tenant_header.inspect

tenant_footer = Page.find_or_create_by(name: "tenant-footer") do |page|
  page.title = "tenant-footer"
  page.content = "tenant-footer-content"
end
puts tenant_footer.inspect

