module ApplicationHelper
  def flash_class(level)
    case level.to_sym
      when :notice then 'alert alert-success'
      when :alert then 'alert alert-danger'
    end
  end

  def headline(args = {})
    @headline = set_headline(args[:path])
  end

  private
  def set_headline(path)
    case path
      when new_restaurant_path
        'Create restaurant'
      when restaurants_path
        @restaurant.name
      when new_dish_path
        'Add a Dish'
      when new_menu_path
        'Add menu'
      when edit_menu_path
        'Edit menu'
      when menu_path
        @menu.title
      when new_user_registration_path
        binding.pry
        #This will be a real problem
        'Sign up as Customer'
      when user_registration_path
        binding.pry
      else
        binding.pry
        'Default headline'
    end
  end

end
