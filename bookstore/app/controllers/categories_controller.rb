class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show 
    @category = Category.find(params[:id])
    @categories = Category.all
    @books = @category.books
  end

  def new
  	@page_title = "Add new category"
  	@category = Category.new
  end

  def create 
  	@category = Category.new(category_params)
  	if @category.save 
      flash[:notice] = "Category Created!"
  		redirect_to categories_path
  	else 
  		render 'new'
  	end
  end

  def edit 
    @category = Category.find(params[:id])
  end

  def update 
     @category = Category.find(params[:id])
     @category.update_attributes(category_params)
     if @category.save 
      flash[:notice] = "Category Updated"
      redirect_to categories_path
    else 
      render 'edit'
    end
  end

  def destroy 
     @category = Category.find(params[:id])
     @category.destroy
     flash[:notice] = "Category Destroyed"
     redirect_to categories_path
  end

  private 
  	def category_params 
  		params.require(:category).permit(:name)
  	end
end
