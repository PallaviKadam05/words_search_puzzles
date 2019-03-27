class AddTimeToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :player_time, :string
  end
end
