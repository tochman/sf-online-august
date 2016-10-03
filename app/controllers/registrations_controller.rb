class RegistrationsController < Devise::RegistrationsController

  def new
    options = params[:role] ? {role: params[:role]} : {}
    build_resource(options)
    yield resource if block_given?
    respond_with resource
  end

  protected

  def after_sign_up_path_for(resource)
    resource.owner? ? new_restaurant_path : carts_path
  end

  def sign_up_params
    params.require(:user).permit(:name,
                                 :email,
                                 :address,
                                 :password,
                                 :password_confirmation,
                                 :role)

  end

end
