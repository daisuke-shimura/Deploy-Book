class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    #comment = current_user.book_comments.new(book_comment_params)
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    if comment.save
      flash[:notice] = "投稿に成功したよ"
      redirect_to book_path(book)
    else
      flash[:notice] = "投稿に失敗したよ"
      redirect_to book_path(book)
    end
  end

  def edit
    #@book = Book.find(params[:id])
    @comment = BookComment.find(params[:id])
  end

  def update
    @book_comment = BookComment.find(params[:id])
    if @book_comment.update(book_comment_params)
      flash[:notice] = "変更できました"
      redirect_to book_path(params[:book_id])
    else
      flash.now[:notice] = "変更できなかったよ"
      @comment = BookComment.find(params[:id])
      render :edit
    end
  end

  def destroy
    comment = BookComment.find(params[:id])
    if comment.destroy
      flash[:notice] = "削除できたよ"
      redirect_to book_path(params[:book_id])
    else
      flash[:notice] = "削除できませんでした"
      redirect_to book_path(params[:book_id])
    end
  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
