class CreateTypeBQuestions < ActiveRecord::Migration
  def up
    create_table :type_b_questions do |t|
      t.integer "ref_pic", :null => false
      t.boolean "sticky", :null => false, :default => false
      t.timestamps
    end
  end
  
  def down
    drop_table :type_b_questions
  end
end
