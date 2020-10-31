class LikesController < ApplicationController


  def create
    like = Like.new(like_params)

    if like.save
      render json: { success: true }
    else
      render json: { success: false, errors: like.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :flat_id)
  end
end
