class AddJobToWorker < ActiveRecord::Migration
  def change
    add_reference :workers, :job, index: true
  end
end
