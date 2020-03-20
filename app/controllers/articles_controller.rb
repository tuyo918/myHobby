class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def show 
     @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "保存できました"
      redirect_to articles_path
    else
      flash[:alert] = "保存できませんでした"
      render 'articles/new'
    end
    
  end
  
  def index
    @articles = Article.all
  end
    
   private
 
  def article_params
      params.require(:article).permit(:image)
  end
end
