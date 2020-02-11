class Post < ApplicationRecord
  validates :title, length: { maximum: 20}
  validates :content, length: {maximum: 120}
  acts_as_taggable
  belongs_to :user
end
