class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, presence: true, allow_blank: false
  validates_uniqueness_of :cocktail, scope: :ingredient
end
