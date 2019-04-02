class AddsolvedwordsToHistories < ActiveRecord::Migration[5.2]
  def change
  	 add_column :histories, :solved_words_count, :bigint
  end
end
