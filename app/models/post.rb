class Post < ApplicationRecord
  validates :title, length: { maximum: 20}
  validates :content, length: {maximum: 120}
  validates :desire, length: {maximum: 90}
  acts_as_taggable
  belongs_to :user
end
