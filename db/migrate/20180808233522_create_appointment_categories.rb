class CreateAppointmentCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :appointment_categories do |t|
      t.integer :appointment_id
      t.integer :category_id
      t.timestamps
    end
  end
end
