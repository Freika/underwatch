class AddDefaultValueToApproved < ActiveRecord::Migration[5.0]
  def change
    change_column :participations, :approved, :boolean, default: false
  end
end
