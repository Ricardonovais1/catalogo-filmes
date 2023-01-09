class Director < ApplicationRecord
  belongs_to :category
  has_many   :film
end
