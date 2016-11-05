class RenameUserIdToAuthorId < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :user_id, :author_id
  end
end
