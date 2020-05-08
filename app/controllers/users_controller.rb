class UsersController < ApplicationController
  
  def show
    @salon = Salon.find_by(id: params[:id])
    @user = User.find_by(id: params[:id])
    @chats = Chat.where(salon_id: @salon.id, user_id: [@salon.user_id, @user.id]).order(created_at: :asc)
    @chat = Chat.new
  end
  

  def index
    @users = User.all
  end

 private
  def user_params
    params require(:user).permit(:email, :nickname, :gender, :zipcode, :prefecture, :city, :name, :passeword, {images: []})
  end
end
