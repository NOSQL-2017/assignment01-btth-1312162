class BooksController < ApplicationController
  def index
  	@page_title = "Home"
    @books = Book.all 
    @categories = Category.all
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def new 
  	@page_title = "Add Book"
  	@book = Book.new
    @category = Category.new 
    @author = Author.new 
    @publisher = Publisher.new 
  end

  def create 
    @book = Book.new(book_params)
    @book.save 
    flash[:notice] = "Book Created"
    redirect_to books_path
  end

  def edit 
    @book = Book.find(params[:id])
  end

  def update 
    @book = Book.find(params[:id])
    @book.update_attributes(book_params) 
    flash[:notice] = "Book Updated"
    redirect_to books_path
  end

  def destroy 
    @book = Book.find(params[:id])
    @book.destroy 
    flash[:notice] = "Book Destroyed"
    redirect_to books_path
  end

  private 
  	def book_params
  		params.require(:book).permit(:title, :category_id, :author_id, :publisher_id, :isbn, :price, :format, :excerpt, :pages, :year, :cover_path)
  	end
end
