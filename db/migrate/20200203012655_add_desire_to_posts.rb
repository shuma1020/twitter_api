class AddDesireToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :desire, :string
  end
end
