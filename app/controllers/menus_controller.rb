class MenusController < ApplicationController
  before_action :find_menu_from_params, only: [:show, :edit, :update]

  def index
  end

  def new
    @menu = Menu.new
  end

  def show
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:notice] = "Successfully added menu"
      render :show
    else
      flash[:alert] = @menu.errors.full_messages.first
      render :new
    end
  end

  def edit
    @dishes = Dish.all #this needs to be restricted to only dishes created by the restaurant later on
  end

  def update
    @menu.update(menu_params)
    render :show
  end

  private
  def menu_params
    params.require(:menu).permit(:title, {dish_ids: []})
  end

  def find_menu_from_params
    @menu = Menu.find(params[:id])
  end
end
