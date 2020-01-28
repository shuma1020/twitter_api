class Post < ApplicationRecord
  validates :title, length: { maximum: 20}
end
