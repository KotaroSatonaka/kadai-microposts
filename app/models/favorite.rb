class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :micro_post
  
  validates :user_id, presence: true
  validates :micro_post_id, presence: true
end
