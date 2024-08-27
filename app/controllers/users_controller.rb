class UsersController < ApplicationController
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
      flash[:notice] = "変更できなかったよ"
      render :show
    end
  end

  private
  def user_params
    params.require(:user).permit(:image,:name,:introduction)
  end

end
