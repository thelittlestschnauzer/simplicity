class Note < ApplicationRecord
  validates :title, presence: true
  has_many :messages 
end
