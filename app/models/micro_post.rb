class MicroPost < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  def favorite?(other_micro_post)
    self.favorites.include?(other_micro_post)
  end
  
  def favorite(other_micro_post)
    unless self == other_micro_post
      self.favorites.find_or_create_by(micro_post_id: other_micro_post.id)
    end
  end
  
  def unfavorite(other_micro_post)
    favorite = self.favorites.find_by(micro_post_id: other_micro_post.id)
    favorite.destroy if favorite
  end
end
