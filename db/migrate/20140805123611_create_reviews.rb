class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :price
      t.integer :clean
      t.integer :quilty
      t.integer :disicpline
      t.integer :treatment
      t.integer :worker_id

      t.timestamps
    end
    add_index :reviews, [:worker_id, :created_at]
  end
end
