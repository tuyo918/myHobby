module SalonJoinsHelper
    
    # そのサロンに参加しているか、しているならstatusは何？
    def salon_join_status(salon_id)
        if salon_join = SalonJoin.find_by(user_id: current_user.id, salon_id: salon_id)
            return salon_join.status
        else
            return false
        end
    end
    
end
