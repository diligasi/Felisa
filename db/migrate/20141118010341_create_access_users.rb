class CreateAccessUsers < ActiveRecord::Migration
  def change
    create_table :access_users do |t|
      t.string :name
      t.string :pass

      t.timestamps
    end
  end
end
