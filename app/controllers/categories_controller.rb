class CategoriesController < ApplicationController
  
  def new
    # ダミーインスタンス
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save 
      flash[:notice] = "新規Category登録しました"
      redirect_to categories_path
    else
      flash[:notice] = "新規Category登録できませんでした"
      render "categories/new"
    end
  end
  
  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end
  
  def update
    @category = Category.find_by(id: params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category更新しました"
      redirect_to categories_path
    else
      flash[:notice] = "新規Category変更できませんでした"
      render "categories/edit"      
    end
    
  end
  
  private
    def category_params
      params.require(:category).permit(:name, :detail, :image)
    end
  
end
