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

  def accept_answer
    answer = Answer.find(params[:id])
    if answer.update(accept: answer_params)
      render json: { message: 'Answer accepted' }, status: 200
    else
      render json: { message: 'Error while accepting answer' }, status: 500
    end
  end

  # Only allow a list of trusted parameters through.
  # 
  def answer_params
    params.permit(:id, :question_id, :body, :accept)
  end
end
