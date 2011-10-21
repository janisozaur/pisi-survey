class AddFilledColumnToSurveys < ActiveRecord::Migration
  def up
    add_column :surveys, :filled, :boolean, :null => false, :default => false
  end

  def down
    remove_column :surveys, :filled
  end
end
