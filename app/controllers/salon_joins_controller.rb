class SalonJoinsController < ApplicationController
    
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
    
    private
     def salon_join_params
         params.require(:salon_join).permit(:memo, :salon_id, :user_id, :status).merge(user_id: current_user.id, status: "r")
     end
end
