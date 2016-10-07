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
      when root_path
        if current_user
          "Cart for #{current_user.name}"
        else
          'Your cart'
        end
      when new_restaurant_path
        'Create restaurant'
      when restaurants_path
        @restaurant.name
      when new_dish_path
        'Add a Dish'
      when new_menu_path
        'Add menu'
      when carts_path
        if current_user
          "Cart for #{current_user.name}"
        else
          'Your cart'
        end
      #This will be a real problem

      # when edit_menu_path(params[:id])
      #   'Edit menu'
      # when menu_path(params[:id])
      #   @menu.title
      when new_user_registration_path
        if params[:role] == 'owner'
          'Sign up as Owner'
        else
          'Sign up as Customer'
        end
      else
        ''
    end
  end

end
