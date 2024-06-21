class BooksController < ApplicationController
  def show
    @book = Book.new
  end

  def edit
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new
    @book.user_id = current_user.id
    if @book.save
      redirect_to root_path
    else
      render :index
    end
  end

end
