class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更できたよ"
      redirect_to books_path
    else
      #@user = User.find(params[:id])
      flash.now[:notice] = "変更できなかったよ"
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:image,:name,:introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
  end

end
