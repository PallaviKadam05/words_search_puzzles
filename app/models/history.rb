class History < ApplicationRecord
  belongs_to :word ,optional: true
  belongs_to :user ,optional: true
end
