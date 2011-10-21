class CreateTypeCAnswers < ActiveRecord::Migration
  def up
      create_table :type_c_answers do |t|
        t.integer "survey_id", :null => false
        t.integer "question_id", :null => false
        t.integer "value", :null => false
        t.timestamps
      end
    end
    
    def down
      drop_table :type_c_answers
    end
end
