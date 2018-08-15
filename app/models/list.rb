class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user 

  validates :title, presence: true
  accepts_nested_attributes_for :tasks, :allow_destroy => true
end
