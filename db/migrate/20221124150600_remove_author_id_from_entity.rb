class RemoveAuthorIdFromEntity < ActiveRecord::Migration[7.0]
  def change
    remove_column :entities, :author_id, :integer
  end
end
