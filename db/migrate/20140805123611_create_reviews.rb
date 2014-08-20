class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :price
      t.integer :clean
      t.integer :quilty
      t.integer :disicpline
      t.integer :treatment
      t.string :comment
      t.integer :worker_id
      t.string :client_name
      t.string :client_phone
      t.string :client_email
      t.string :client_addres

      t.timestamps
    end
  end
end