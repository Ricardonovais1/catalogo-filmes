class Director < ApplicationRecord
  has_many   :film
  belongs_to :category
end
