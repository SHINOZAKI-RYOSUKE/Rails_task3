class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  
  
  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id), notice:"Book was successfully created."
    else
    @books = Book.all
    render "index"
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice:"Book was successfully updated."
    else
    render "edit"
    end
  end
  

  def show
  end

  def edit
  end
  
  
  
  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
  
end