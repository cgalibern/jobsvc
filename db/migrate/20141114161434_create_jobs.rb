class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :jobname
      t.integer :service_id
      t.string :status
      t.datetime :begin
      t.datetime :end
      t.time :duration

      t.timestamps
    end
  end
end
