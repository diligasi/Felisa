class CreateTestimoniais < ActiveRecord::Migration
  def change
    create_table :testimoniais do |t|
      t.string :name
      t.text :testimonial

      t.timestamps
    end
  end
end
