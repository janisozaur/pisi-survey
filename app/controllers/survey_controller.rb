class SurveyController < ApplicationController
  def index
    @surveys = Survey.all
    @a_questions = TypeAQuestion.find_all_by_sticky(false)
  end
  
  def new
    @survey = Survey.new
    @survey.part = "a"
    @survey.save
    @survey.additional_fields = {"auth" => Digest::SHA1.hexdigest(@survey.id.to_s + @survey.created_at.to_s)}
    @sticky_a_questions = TypeAQuestion.find_all_by_sticky(true)
    @nonsticky_a_questions = TypeAQuestion.find_all_by_sticky(false)
    @new_a_question = TypeAQuestion.new
  end
  
  def create
    logger.info params.inspect
    logger.info "param qa: " + params[:qa].inspect
    logger.info "param additional: " + params[:additional].inspect
    @survey = Survey.find_by_id(params[:survey_id])
    @survey.additional_fields = params[:additional]
    sha1 = Digest::SHA1.hexdigest(@survey.id.to_s + @survey.updated_at.to_s)
    if @survey.additional_fields["auth"] != sha1
      redirect_to('/survey/new', :alert => "próbowałeś uzyskać nieautoryzowany dostęp")
      return
    end
    @survey.part = params[:survey_part]
    logger.info "survey: " + @survey.inspect
    if params[:survey_part] == "a"
      params[:qa].each do |question|
        @answer = TypeAAnswer.new(:survey_id => params[:survey_id], :question_id => question[0], :value => question[1]["resemblance"])
        @survey.additional_fields["a" + @answer.question_id.to_s] = question[1]["resemblance"]
        logger.info question.inspect
        logger.info @answer.inspect
      end
      @survey.part = "b"
      @sticky_b_questions = TypeBQuestion.find_all_by_sticky(true)
      @nonsticky_b_questions = TypeBQuestion.find_all_by_sticky(false)
      render :file => "app/views/survey/newb.html.erb"
    elsif params[:survey_part] == "b"
      @survey.additional_fields = params[:additional]
      params[:qb].each do |question|
        @answer = TypeBAnswer.new(:survey_id => params[:survey_id], :question_id => question[0], :value_pear => question[1]["resemblance_pear"], :value_kidney => question[1]["resemblance_kidney"])
        @survey.additional_fields["b" + @answer.question_id.to_s] = question[1]["resemblance_pear"] + "," + question[1]["resemblance_kidney"]
        logger.info question.inspect
        logger.info @answer.inspect
      end
      @survey.part = "c"
      @sticky_c_questions = TypeCQuestion.find_all_by_sticky(true)
      @nonsticky_c_questions = TypeCQuestion.find_all_by_sticky(false)
      render :file => "app/views/survey/newc.html.erb"
    elsif params[:survey_part] == "c"
      @survey.additional_fields = params[:additional]
      params[:qc].each do |question|
        @answer = TypeCAnswer.new(:survey_id => params[:survey_id], :question_id => question[0], :value => question[1]["resemblance"])
        @survey.additional_fields["c" + @answer.question_id.to_s] = question[1]["resemblance"]
        logger.info question.inspect
        logger.info @answer.inspect
      end
      
      @survey.additional_fields.each do |field|
        logger.info "trying to match against " + field.inspect
        if field[0] =~ /a([0-9]+)/
          @answer = TypeAAnswer.new(:survey_id => params[:survey_id], :question_id => $1, :value => field[1])
        elsif field[0] =~ /b([0-9]+)/
          @answer = TypeBAnswer.new(:survey_id => params[:survey_id], :question_id => $1, :value_pear => field[1].split(",")[0], :value_kidney => field[1].split(",")[1])
        elsif field[0] =~ /c([0-9]+)/
          @answer = TypeCAnswer.new(:survey_id => params[:survey_id], :question_id => $1, :value => field[1])
        end
        if !@answer.nil?
           @answer.save!
        end
      end
      @survey.filled = true
      @survey.save!
      redirect_to('/')
    end
  end
end