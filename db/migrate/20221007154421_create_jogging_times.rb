class CreateJoggingTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :jogging_times do |t|
      t.integer :distance
      t.datetime :date
      t.time :time
      t.timestamps
    end
  end
end
