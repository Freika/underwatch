class AddTimezoneToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :timezone, :string, default: 'Moscow'
  end
end
