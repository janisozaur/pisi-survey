class CreateTypeAAnswers < ActiveRecord::Migration
  def up
    create_table :type_a_answers do |t|
      t.integer "type_a_question_id", :null => false
      t.integer "survey_id", :null => false
      t.integer "question_id", :null => false
      t.integer "value", :null => false
      t.timestamps
    end
  end
  
  def down
    drop_table :type_a_answers
  end
end
