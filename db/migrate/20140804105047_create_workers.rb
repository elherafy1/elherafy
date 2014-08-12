class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.string :area
      t.string :status
      t.string :kind

      t.timestamps
    end
  end
end
