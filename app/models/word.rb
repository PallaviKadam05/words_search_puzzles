class Word < ApplicationRecord
	serialize :words_search, Array
	has_many :histories, :dependent => :destroy
end
