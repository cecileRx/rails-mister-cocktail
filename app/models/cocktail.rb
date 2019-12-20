

class Cocktail < ApplicationRecord
   has_many :doses, dependent: :destroy
   has_many :ingredients, through: :doses
   validates :name, allow_blank: false, presence: true
   has_one_attached :photo

end
