class SalonsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new]
  

  def new
    @salon = Salon.new
  end
  
  def create 
    @salon = Salon.new(salon_params)
    
    if @salon.save
      flash[:notice] = "サロン作成しました"
      redirect_to salons_path
    else
      flash[:alert] = "サロン作成できませんでした"
      render "salons/new"
    end
  end
  
  def edit
    @salon=Salon.find_by(id: params[:id])
  end
  
  def update
    @salon=Salon.find_by(id: params[:id])
    if @salon.update(salon_params)
      flash[:notice] = "サロン情報更新しました"
      redirect_to salons_path      
    else
      flash[:alert] = "サロン情報更新できませんでした"
      render "salons/edit"      
    end
  end
  

  def index
    # ログインしている人の作成したsalonsを表示したいから
    @salons = Salon.where(user_id: current_user.id)
    @posts=Post.where(id: params[:category_id]).order(created_at: :desc)
  end

   #空のときとsearchにこめが入ったときで受け取り方が変わる
  def show
    logger.debug("=================search text params #{params[:search]}")
    @salon = Salon.find_by(id: params[:id])
    post_search(params[:search])
    logger.debug("===================== @salon.id = #{@salon.id} controller @salon.images.count = #{@salon.images.count}")
    @salon_join = SalonJoin.new
  end
  
  def category
    @category = Category.find_by(id: params[:id])
    @salons = Salon.where(category: @category.id)
  end
  
  def destroy
    @salon=Salon.find_by(id: params[:id])
     if @salon.destroy
      flash[:notice] = "削除しました"
      redirect_to salons_path
     else
      flash[:notice]="削除できませんでした"
      render "salons/new"
     end
  end
  
  
  
  private 
    def salon_params
      params.require(:salon).permit(:title, :description, :user_id, :icon, :category_id, :nickname, :search_word, :fee, {images: []}, {videos: []}, :introduction)
    end
    
    def post_search(keyword)
      if keyword.present?
        @posts = @salon.posts.where("title LIKE ?", "%#{keyword}%").order(created_at: :desc)
      else
        @posts = @salon.posts.order(created_at: :desc)
      end
    end
  
end
