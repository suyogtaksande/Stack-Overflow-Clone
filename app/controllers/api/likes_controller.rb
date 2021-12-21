class Api::LikesController < ApplicationController

  def create
    params[:user_id] = current_user.id
    like = Like.new(like_params)

    if like.save!
      render json: { message: 'Liked', questions: like }, status: 200
    else
      ender json: { message: @like.errors.full_messages.join(', ') }, status: 500
    end
  end

  def destroy
    like = current_user.likes.find(params[:id])
    if like.destroy
			byebug
      render json: { message: 'Unliked', questions: like }, status: 200
    else
      render json: { message: 'Error while unliking', questions: like }, status: 500
    end
  end

  protected

  def like_params
    params.permit(:value, :user_id, :reference_id, :reference_type)
  end
end
