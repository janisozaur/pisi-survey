class CreateSurveys < ActiveRecord::Migration
  def up
    create_table :surveys do |t|
      t.timestamps
    end
  end
  
  def down
    drop_table :surveys
  end
end
