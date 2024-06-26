class BooksController < ApplicationController
  def show
    @book = Book.new
    @user = current_user
    @booker = Book.find(params[:id])
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
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(book.id)
  end


private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
