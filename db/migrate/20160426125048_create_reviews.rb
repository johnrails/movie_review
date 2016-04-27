class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.decimal :rating
      t.text :comment
      t.string :email

      t.timestamps null: false
    end
  end
end
