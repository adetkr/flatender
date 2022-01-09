class UsersController < ApplicationController


def show
  @user = User.find(params[:id])
      @matchs = []
    @match = nil
    current_user.flats.each do |flat|
      flatmatchs = FlatMatch.where(flat_id: flat.id)
      flatmatchs.each do |flatmatch|
        @matchs << Match.find(flatmatch.match.id)
      end
    end
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
      @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit

    end
end

private
   def user_params
    params.require(:user).permit(:name, :presentation, :university, :photo)
  end
end
