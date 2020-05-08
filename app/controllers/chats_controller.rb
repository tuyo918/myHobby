class ChatsController < ApplicationController
  
  def index
    @salon = Salon.find_by(id: params[:salon_id])
    # このサロンに参加している人のchat全チャットレコード
    @chats = Chat.where(salon_id: params[:salon_id]).order(created_at: :desc)
    
    user_ids = []
    @users = []
    
    # このサロンのオーナー以外のchatやりとり全件は　==> 
    @chats.where.not(user_id: @salon.user_id).each do |chat|
      unless user_ids.include?(chat.user_id)
        user_ids << chat.user_id
        @users << User.find_by(id: chat.user_id)
      end
    end
  end
  
  
  def show
    @salon = Salon.find_by(id: params[:salon_id])
    @user = User.find_by(id: params[:user_id])
    @chats = Chat.where(salon_id: @salon.id, user_id: [@salon.user_id, @user.id]).order(created_at: :asc)
    @chat = Chat.new
  end
  
  def create
    @salon = Salon.find_by(id: params[:salon_id])
    @chat = Chat.new(chat_params)
    if @chat.save
      flash[:notice] = "送信しました"
      redirect_to salon_path(@salon.id)
    else
      flash[:notice] = "送信できませんでした"
      render 'chats/show'
    end
  end
  
  private 
    def chat_params
      params.require(:chat).permit(:salon_id, :user_id, :content).merge(user_id: current_user.id)
    end
  
end
