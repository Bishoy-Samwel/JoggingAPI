class AddWeekToJoggingTimes < ActiveRecord::Migration[7.0]
  def change
    add_column :jogging_times, :week, :integer
  end
end
