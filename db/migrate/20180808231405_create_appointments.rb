class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :title
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :allDay, default: false
      t.timestamps
    end
  end
end
