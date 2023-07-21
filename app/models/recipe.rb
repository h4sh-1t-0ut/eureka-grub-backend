class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    validates :name, :instructions, :cook_time, :ingredients, :course, :servings, :allergies, :tutorial_link, :recipe_image,:user_id, presence: true
end
