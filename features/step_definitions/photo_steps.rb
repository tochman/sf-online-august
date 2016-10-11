When(/^I add an image to "([^"]*)"$/) do |dish_name|
  dish = Dish.find_by(name: dish_name)
  visit edit_dish_path(dish)
  attach_file 'Upload an image', 'spec/fixtures/pizza.jpg'
end

Then(/^I should see a dish image$/) do
  expect(page).to have_css("img[src*='pizza.jpg']")
end

Then(/^I should not see the missing image placeholder$/) do
  expect(page).not_to have_css("img[src*='missing.png']")
end
