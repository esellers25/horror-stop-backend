class ReviewSerializer < ActiveModel::Serializer
    attributes :id, :rating, :spook_factor, :comment, :user_id, :movie_id 
  end
  