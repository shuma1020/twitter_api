class Post < ApplicationRecord
  validates :title, length: { maximum: 20}
  acts_as_taggable
end
