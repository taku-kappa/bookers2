class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = current_user
    user = User.find(params[:id])
    @books = user.books
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
    @user = User.find(params[:id])
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
