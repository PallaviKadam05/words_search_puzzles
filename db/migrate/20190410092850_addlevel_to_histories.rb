class AddlevelToHistories < ActiveRecord::Migration[5.2]
  def change
  	 add_column :histories, :level, :string
  end
end
