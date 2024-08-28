class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      flash[:notice] = "投稿に成功したよ"
      redirect_to book_path(@book.id)
    else
      @hon = Book.all
      flash.now[:notice] = "投稿に失敗しました"
      render :index
    end
  end

  def index
    @hon = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "変更できたよ"
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "変更できなかったよ"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "削除できたよ"
      redirect_to books_path
    else
      flash[:notice] = "削除できなかったよ"
      render :show
    end
  end


  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end

end
