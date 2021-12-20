class Api::QuestionsController < ApplicationController

  def create
    question = current_user.questions.new(question_params)
    if question.save!
      render json: { message: 'Saved' }, status: 200
    else
      render json: { message: 'Error while saving question' }, status: 500
    end
  end

  # Only allow a list of trusted parameters through.
  # 
  def question_params
    params.permit(:user_id, :title, :body)
  end
end