class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = current_user.books
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user

    if @book.valid?
      @book.save

      redirect_to book_path(@book), alert: "Book successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      
      redirect_to book_path(@book), alert: "Book successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @book.destroy

    redirect_to root_path, alert: "Book successfully deleted"
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :quote)
  end
end
