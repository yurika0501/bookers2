class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = Book.all
  end
  
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    # @books = Book.all
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def update
    @user = User.find(params[:id])
    @profile_image = ProfileImage.new(profile_image_params)
    
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:image, :name )
    params.require(:user).permit(:title, :body )
    @user = User.find(params[:id])
  end
end

