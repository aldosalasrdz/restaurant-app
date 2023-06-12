class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to dishes_path
    else
      render 'new'
    end
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def update
    @dish = Dish.find(params[:id])

    if @dish.update(dish_params)
      redirect_to @dish
    else
      render 'edit'
    end
  end

  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy

    redirect_to dishes_path
  end

  private

  def dish_params
    params.require(:dish).permit(:dish_group, :name, :description, :price, :photo)
  end
end
