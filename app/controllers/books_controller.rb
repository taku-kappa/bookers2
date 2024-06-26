class BooksController < ApplicationController
  before_action :is_matching_login_user_book, only: [:edit, :update]
  def show
    @book = Book.new
    @booker = Book.find(params[:id])
    @user = @booker.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end


private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user_book
    book =Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end

end
