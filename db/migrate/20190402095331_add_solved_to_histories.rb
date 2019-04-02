class AddSolvedToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :solved, :string
  end
end
