class CreateDriverSchedules < ActiveRecord::Migration
  def change
    create_table :driver_schedules do |t|
      t.integer :driver_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
