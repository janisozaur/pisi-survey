class TypeBAnswer < ActiveRecord::Base
  belongs_to :survey
  belongs_to :type_b_question
  validates_numericality_of :survey_id
  validates_numericality_of :question_id
end
