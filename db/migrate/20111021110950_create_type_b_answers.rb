class CreateTypeBAnswers < ActiveRecord::Migration
  def up
      create_table :type_b_answers do |t|
        t.integer "survey_id", :null => false
        t.integer "question_id", :null => false
        t.integer "value_pear", :null => false
        t.integer "value_kidney", :null => false
        t.timestamps
      end
    end
    
    def down
      drop_table :type_b_answers
    end
end
