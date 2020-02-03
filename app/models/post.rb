class Post < ApplicationRecord
  validates :title, length: { maximum: 20}
  acts_as_taggable
  belongs_to :user
end
