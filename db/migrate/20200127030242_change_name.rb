class ChangeName < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :hash, :hash_tag
  end
end
