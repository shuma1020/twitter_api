class AddKindToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :kind, :string
  end
end
