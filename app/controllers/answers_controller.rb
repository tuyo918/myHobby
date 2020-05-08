class AnswersController < ApplicationController
  
  def new
    @inquiry = Inquiry.find_by(id: params[:inquiry_id])
    @answer =  Answer.new(inquiry_id: @inquiry.id)
  end
  
  def create
    @answer = Answer.new(answer_params)
    
    if @answer.save
      flash[:notice] = "送信されました"
      redirect_to inquiries_path
    else
      flash[:notice] = "送信できませんでした"
      render ("answers/new")
    end
    
  end
  
 private
  def answer_params
    params.require(:answer).permit(:content, :inquiry_id).merge(inquiry_id: params[:inquiry_id])
  end
  
end
