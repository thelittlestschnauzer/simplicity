class Appointment < ApplicationRecord
  has_many :appointment_categories
  has_many :categories, through: :appointment_categories
  belongs_to :user
  
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end
end
