class CreateTypeAAnswersForeignKeys < ActiveRecord::Migration
  def up
    execute "ALTER TABLE type_a_answers ADD CONSTRAINT type_a_answers_surveys_foreign_key FOREIGN KEY (survey_id) REFERENCES surveys (id)"
    execute "ALTER TABLE type_a_answers ADD CONSTRAINT type_a_answers_type_a_questions_foreign_key FOREIGN KEY (question_id) REFERENCES type_a_questions (id)"
  end

  def down
    execute "ALTER TABLE type_a_answers DROP CONSTRAINT type_a_answers_surveys_foreign_key"
    execute "ALTER TABLE type_a_answers DROP CONSTRAINT type_a_answers_type_a_questions_foreign_key"
  end
end
