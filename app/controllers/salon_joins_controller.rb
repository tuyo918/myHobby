class SalonJoinsController < ApplicationController
  
    def index
      @salon = Salon.find_by(id: params[:salon_id])
      @salon_joins = SalonJoin.where(salon_id: @salon.id)
    end
    
    def joined_salons
      @salon_joins = SalonJoin.where(user_id: current_user.id)
    end
    
    def create
      @salon_join = SalonJoin.new(salon_join_params)
        if @salon_join.save
          flash[:notice] = "参加申込を送信しました"
          redirect_to  salon_path(@salon_join.salon_id)
        else
          flash[:alert] = "参加リクエストが送れませんでした"
          render "salons/show"
        end

    end
    
   
    def update 
      @salon_join = SalonJoin.find_by(id: params[:id])
      @salon_join.status = params[:salon_join][:status]
      
      if @salon_join.status == "p"
        flash_message = "承認"
      elsif @salon_join.status == "b"
        flash_message= "拒否"
      elsif @salon_join.status == "r"
        flash_message = "承認解除"
      end
      
      if @salon_join.save
        flash[:notice] = "#{flash_message}しました"
      else
        flash[:alert] = "#{flash_message}できませんでした"
      end
        redirect_to  salon_salon_joins_path(@salon_join.salon_id)
    end
    
    private
     def salon_join_params
         params.require(:salon_join).permit(:memo, :salon_id, :user_id, :status).merge(user_id: current_user.id, status: "r")
     end
end
