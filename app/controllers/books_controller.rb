class BooksController < ApplicationController
before_action :authenticate_user!, except: [:top, :about]

  def top
    if user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end

  def index
    @books = Book.all
    @new = Book.new
    @user = current_user
  end

  def about
  end

  def show
    @book = Book.find(params[:id])
    @new = Book.new
  end

  def new
  	@book = Book.new
    @books = Book.all
  end

  def create
  	book = Book.new(book_params)
    book.user_id = current_user.id
  	book.save
  	redirect_to user_path(current_user.id)
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
  	book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

 end
