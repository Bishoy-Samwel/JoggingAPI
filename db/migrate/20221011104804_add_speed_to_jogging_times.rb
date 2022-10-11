class AddSpeedToJoggingTimes < ActiveRecord::Migration[7.0]
  def change
    add_column :jogging_times, :speed, :decimal
  end
end
