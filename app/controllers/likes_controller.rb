class LikesController < ApplicationController


  def create
    like = Like.new(like_params)

    if like.save
      if like.match_exist?
        if Match.last.flat1.user == current_user
        render json: { success: true , match_exist: true, matchid: "#{Match.last.id}", matchname: "#{Match.last.flat2.user.name}" }
        else
        render json: { success: true , match_exist: true, matchid: "#{Match.last.id}", matchname: "#{Match.last.flat1.user.name}" }
        end

      else
        render json: { success: true , match_exist: false}
      end
    elsif like.save

    else
      render json: { success: false, errors: like.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :flat_id)
  end
end
