class ChangeTimeAndDestanceToDecimal < ActiveRecord::Migration[7.0]
  def change
    change_table :jogging_times do |table|
      table.change :time, :decimal
      table.change :distance, :decimal
    end
  end
end
