class AddAnotherColumnToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :content, :text
    add_column :notes, :created_on, :datetime 
  end
end
