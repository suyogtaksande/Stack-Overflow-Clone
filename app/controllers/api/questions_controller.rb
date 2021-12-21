class Api::QuestionsController < ApplicationController
  def create
    question = current_user.questions.new(question_params)
    question.tag_list.add(params[:tag_list])
    if question.save!
      render json: { message: 'Saved' }, status: 200
    else
      render json: { message: 'Error while saving question' }, status: 500
    end
  end

  def update
    question = Question.find(params[:id])
    if question.update(question_params)
      render json: { message: 'Question updated', question: question }, status: 500
    else
      render json: { message: 'Error while updating question' }, status: 500
    end
  end

  def show
    question = Question.find(params[:id])
    if question
      render json: { message: 'Successfull', question: question }, status: 500
    else
      render json: { message: 'No record found.' }, status: 404
    end
  end

  def index
    questions = Question.all
    data = questions.collect { |question| { question: question, answers: { answer: question.answers } } }
    if questions
      render json: { message: 'Successful', questions: data }, status: 200
    else
      render json: { message: 'No record found.' }, status: 404
    end
  end

  def user_questions
    user = User.find(params[:user_id])
    if user
      questions = Question.where(user_id: params[:user_id])
      if user && questions
        render json: { message: "All question by #{user.email}", total: questions.count, questions: questions },
               status: 200
      else
        render json: { message: 'No record found.' }, status: 404
      end
    else
      render json: { message: 'User not found.' }, status: 404
    end
  end

  def search_by_tag
    questions = Question.tagged_with([params[:tag_list]], any: true)
    if questions
      render json: { message: 'Successful', total: questions.count, questions: questions, tags: params[:tag_list] }, status: 200
    else
      render json: { message: 'No record found.' }, status: 404
    end
  end

  # Only allow a list of trusted parameters through.
  #
  def question_params
    params.permit(:user_id, :title, :body, :tag_list)
  end
end
