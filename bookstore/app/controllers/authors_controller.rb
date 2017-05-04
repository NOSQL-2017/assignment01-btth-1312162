class AuthorsController < ApplicationController
  def index
    @authors = Author.all 
  end

  def new
  	@page_title = "Add new Author"
  	@author = Author.new
  end

  def create 
    @author = Author.new(author_params)
    if @author.save 
      flash[:notice] = "Author Created!"
      redirect_to authors_path
    else
      render 'new' 
    end
  end

  def edit 
    @author = Author.find(params[:id])
  end

  def update 
     @author = Author.find(params[:id])
     @author.update_attributes(author_params)
     if @author.save 
      flash[:notice] = "Author Updated"
      redirect_to authors_path
    else 
      render 'edit'
    end
  end

  def destroy 
     @author = Author.find(params[:id])
     @author.destroy
     flash[:notice] = "Category Destroyed"
     redirect_to authors_path
  end


  private 
  	def author_params 
  		params.require(:author).permit(:first_name, :last_name)
  	end
end
