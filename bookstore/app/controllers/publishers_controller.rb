class PublishersController < ApplicationController
  def index
    @publishers = Publisher.all
  end

  def new
  	@page_title = "Add new publisher"
  	@publisher = Publisher.new
  end

  def create 
    @publisher = Publisher.new(publisher_params)
    if @publisher.save 
      flash[:notice] = "Publisher Created!"
      redirect_to publishers_path
    else
      render 'new'
    end
  end

  def edit 
    @publisher = Publisher.find(params[:id])
  end

  def update 
     @publisher = Publisher.find(params[:id])
     @publisher.update_attributes(publisher_params)
     if @publisher.save 
      flash[:notice] = "Publisher Updated"
      redirect_to publishers_path
    else 
      render 'edit'
    end
  end

  def destroy 
     @publisher = Publisher.find(params[:id])
     @publisher.destroy
     flash[:notice] = "Publisher Destroyed"
     redirect_to publishers_path
  end

  private 
  	def publisher_params
  		params.require(:publisher).permit(:name)
  	end
end
