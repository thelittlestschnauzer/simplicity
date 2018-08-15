class Category < ApplicationRecord
  has_many :appointment_categories
  has_many :appointments, through: :appointment_categories 
end
