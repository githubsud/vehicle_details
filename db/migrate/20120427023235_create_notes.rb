class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
