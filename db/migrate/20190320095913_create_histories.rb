class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.bigint :score
      t.references :word, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
