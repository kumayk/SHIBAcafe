class CategoriesController < ApplicationController
  def index
  	@categories = Category.find(params[:id])
  end
  def show
  	@category = Category.find(params[:id])
  end

  private
  def category_params
    params.require(:category).permit(:category_name)
  end
end
