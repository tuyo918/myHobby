module SalonJoinsHelper
    
    # そのサロンに参加しているか、しているならstatusは何？
    def salon_join_status(salon_id)
        if salon_join = SalonJoin.find_by(user_id: current_user.id, salon_id: salon_id)
            return salon_join.status
        else
            return false
        end
    end
    
    
    
    def mysalon_requested_count
        
        salon_join_count = {:request => 0, :permit => 0, :block => 0}
     
        Salon.where(user_id: current_user.id).each do |salon|
            salon_join_count[:request] = salon_join_count[:request] + SalonJoin.where(salon_id: salon.id, status: "r").count
            salon_join_count[:permit] = salon_join_count[:permit] + SalonJoin.where(salon_id: salon.id, status: "p").count
            salon_join_count[:block] = salon_join_count[:block] + SalonJoin.where(salon_id: salon.id, status: "b").count
        end

        return salon_join_count
    end  
    
    # あるサロンにrequest中の数
    def salon_requested_count(salon_id)
        SalonJoin.where(salon_id: salon_id, status: "r").count
    end
    
end
