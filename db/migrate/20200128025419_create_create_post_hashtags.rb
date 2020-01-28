class CreateCreatePostHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :create_post_hashtags do |t|
      t.references :post, null: false, foreign_key: true
      t.references :hashtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
