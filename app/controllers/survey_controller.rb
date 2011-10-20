class SurveyController < ApplicationController
  def index
    @surveys = Survey.all
    @a_questions = TypeAQuestion.find_all_by_sticky(false)
  end
  
  def new
    @survey = Survey.new
    @sticky_a_questions = TypeAQuestion.find_all_by_sticky(true)
    @nonsticky_a_questions = TypeAQuestion.find_all_by_sticky(false)
    @new_a_question = TypeAQuestion.new
  end
  
  def create
  end
end