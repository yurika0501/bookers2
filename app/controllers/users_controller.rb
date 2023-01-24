class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @newbook = Book.new
    @books = @user.books
    # @book = Book.find(params[:id])
  end
  
  def index
    # @user = User.find(params[:id])
    @book = Book.new
    # @books = Book.all
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  # def create
  #   @user = User.new(user_params)
  #   @user.user_id = current_user.id
  #   @book.save
  #   #flash[:notice] = "Signed in successfully."
  #   redirect_to book_path(@book.id)
  # end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction )
    # params.require(:user).permit(:title, :body )
    # @user = User.find(params[:id])
  end
  
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
end

