class BooksController < ApplicationController
 before_action :authenticate_user!

  def index
    @books = Book.all

    @user = current_user
    @book = Book.new
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id), notice:"Book was successfully created."
    else
    @user = current_user
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
    @book = Book.find(params[:id])

    @user = @book.user
    @book_new = Book.new
  end


  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
    redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if@book.update(book_params)
    redirect_to book_path(@book.id)
    else
    render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end



  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end