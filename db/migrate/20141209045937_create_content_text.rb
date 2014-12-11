class CreateContentText < ActiveRecord::Migration
  def change
    create_table :content_text do |t|
      t.string :page
      t.string :title
      t.text :page_text
    end
  end
end
