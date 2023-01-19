class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:image, :name,)
    params.require(:user).permit(:title, :body, :image)  
    
  end
end
