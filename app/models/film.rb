class Film < ApplicationRecord
    belongs_to :category
    belongs_to :director
end
