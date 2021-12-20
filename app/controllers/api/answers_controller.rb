class Api::AnswersController < ApplicationController

  def create
    question = Question.find(params[:question_id])
    answer = question.answers.new(answer_params)
    if answer.save!
      render json: { message: 'Answer Saved' }, status: 200
    else
      render json: { message: 'Error while saving answer' }, status: 500
    end
  end

  # Only allow a list of trusted parameters through.
  # 
  def answer_params
    params.permit(:question_id, :body)
  end
end
