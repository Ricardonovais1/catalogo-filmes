class Category < ApplicationRecord
    has_many :film
    has_many :director
end
