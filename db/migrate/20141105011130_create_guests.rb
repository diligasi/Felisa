class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :accompanying_number

      t.timestamps
    end
  end
end
