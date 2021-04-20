class UsersController < ApplicationController
  
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end
  
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end


  def edit
    @user = User.find(params[:id])
    if @user != current_user.id
    redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = current_user.id
    @user.update
    redirect_to user_path(current_user.id)
  end
  
  
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image_id) 
  end
  
end