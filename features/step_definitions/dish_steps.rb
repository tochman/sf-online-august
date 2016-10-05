Then(/^I should be on the dish page for "([^"]*)"$/) do |name|
  dish = Dish.find_by(dish_name: name)
  expect(current_path).to eq dish_path(dish)
end

When(/^I check the "([^"]*)" box$/) do |menu|
  page.check(menu)
end

When(/^visit the "([^"]*)" menu page$/) do |menu_name|
  menu = Menu.find_by(title: menu_name)
  visit menu_path(menu)
end

Given(/^I have the following dishes:$/) do |table|
  restaurant = Restaurant.first
  table.hashes.each do |dish|
    FactoryGirl.create(:dish, dish_name: dish[:name], restaurant: restaurant)
  end
end

Given(/^"([^"]*)" has a dish "([^"]*)"$/) do |name, dish_name|
  restaurant = User.find_by(name: name).restaurant
  FactoryGirl.create(:dish, dish_name: dish_name, restaurant: restaurant)
end
