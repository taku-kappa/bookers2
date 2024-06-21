class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
  end

  def index
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
