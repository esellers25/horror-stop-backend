class Review < ApplicationRecord
    belongs_to :movie 
    belongs_to :user 

    validates :rating, presence: true
    validates :spook_factor, presence: true
    validates :comment, presence: true
end

