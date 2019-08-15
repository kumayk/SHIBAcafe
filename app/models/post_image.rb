class PostImage < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :post_image_category_relations
    has_many :categories, through: :post_image_category_relations
    has_many :image_comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    def liked_by?(user)
      likes.where(user_id: user.id).exists?
    end
end
