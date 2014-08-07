class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :price
      t.integer :clean
      t.integer :quilty
      t.integer :disicpline
      t.integer :treatment

      t.timestamps
    end
  end
end
