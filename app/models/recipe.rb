class Recipe < ApplicationRecord
    belongs_to :user
    validates :name, :instructions, :cook_time, :ingredients, :course, :servings, :allergies, :tutorial_link, :recipe_image,:user_id, presence: true
end
