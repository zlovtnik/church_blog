class AddStatusToPosts < ActiveRecord::Migration[8.0]
  ##
  # Adds a `status` column of type string to the `posts` table.
  def change
    add_column :posts, :status, :string
  end
end
