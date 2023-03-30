class Film < ApplicationRecord
  attribute :cast, :string
  enum status: { rascunho: 0, publicado: 2 }
  belongs_to :director
  belongs_to :category
  has_one_attached :image
end
