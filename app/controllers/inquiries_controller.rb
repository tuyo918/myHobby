class InquiriesController < ApplicationController
  
  def index
    @inquiries = Inquiry.all.order(created_at: :desc)
  end

  def new
    @inquiry = Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    
    if @inquiry.save
      flash[:notice]="送信されました"
      redirect_to root_path
    else
      flash[:notice]="送信できませんでした"
      redirect_to "inquiries/new"
    end
    
  end
  
 private
  def inquiry_params 
    params.require(:inquiry).permit(:name, :email, :content, :created_at, :updated_at)
  end
  
end
