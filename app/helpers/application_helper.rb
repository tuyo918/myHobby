module ApplicationHelper
    
    def request_salons_count
        SalonJoin.where(user_id: current_user.id, status: "r").count
    end
    
    
end

