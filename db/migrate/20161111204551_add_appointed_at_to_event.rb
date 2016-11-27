class AddAppointedAtToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :appointed_at, :datetime
  end
end
