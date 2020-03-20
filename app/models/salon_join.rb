class SalonJoin < ApplicationRecord
  belongs_to :salons
  belongs_to :users
end

