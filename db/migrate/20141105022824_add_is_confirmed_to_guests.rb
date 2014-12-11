class AddIsConfirmedToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :is_confirmed, :boolean
  end
end
