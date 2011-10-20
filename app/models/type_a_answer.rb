class TypeAAnswer < ActiveRecord::Base
  belongs_to :survey, :type_a_question
end
