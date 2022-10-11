class ChangeTimeToIntegerFromJoggingTimes < ActiveRecord::Migration[7.0]
  def change
    change_table :jogging_times do |table|
      table.change :time, :integer
    end
  end
end
