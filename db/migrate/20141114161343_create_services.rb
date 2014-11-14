class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :svcname
      t.string :status

      t.timestamps
    end
  end
end
