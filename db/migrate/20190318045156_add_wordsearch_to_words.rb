class AddWordsearchToWords < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :words_search, :string
  end
end
