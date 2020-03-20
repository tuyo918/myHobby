class PostsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    if params[:salon_id] == "all"
      @posts = Post.all.order(created_at: :desc)
    else
      @posts = Post.where(salon_id: salon_posts).order(created_at: :desc)
    end
    @salon = Salon.find_by(id: params[:salon_id])
  end
  
  def show
    @posts = Post.find_by(id: params[:id])
    post_search(params[:search])
  end
  
  def new
    @post = Post.new
    @salon = Salon.find_by(id: params[:salon_id])
  end
  
  def create
    @post = Post.new(post_params)
    
    if @post.save
      flash[:notice] = "投稿できました"
      redirect_to salon_path(@post.salon_id)
    else
      flash[:notice] = "投稿できませんでした"
      render "posts/new"
    end
  end
  
  def edit
    @post=Post.find_by(id: params[:id])  
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/edit")
    else
     render("/posts/edit")
    end
  end
  
  def destroy
      @post = Post.find_by(id: params[:id])
      @post.destroy
      flassh[:notice] = "投稿を削除しました"
      redirect_to("/posts/index")
  end
  
  def post_search(keyword)
      if keyword.present?
        @posts = Post.where("title LIKE ?", "%#{keyword}%").order(created_at: :desc)
      else
        @posts = Post.posts.order(created_at: :desc)
      end
  end
  
  
  private 
    def post_params
      params.require(:post).permit(:title, :content, :salon_id, {images: []}, {videos: []})
    end
    
  
end