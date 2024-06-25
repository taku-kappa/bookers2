class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = current_user
    user = User.find(params[:id])
    @books.user =
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :show
    end
  end

  def edit
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
