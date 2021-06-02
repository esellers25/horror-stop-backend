class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :poster_url, :year, :runtime, :summary, :watch_providers
  has_many :reviews 
end
