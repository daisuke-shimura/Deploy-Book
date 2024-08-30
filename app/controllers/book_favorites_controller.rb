class BookFavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.book_favorites.new(book_id: book.id)
    if favorite.save
      flash[:notice] = "いいねが追加されました"
      #redirect_to book_path(book)
      redirect_to request.referer
    else
      flash[:notice] = "いいねが追加できなかったよ"
      #redirect_to book_path(book)
      redirect_to request.referer
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.book_favorites.find_by(book_id: book.id)
    if favorite.destroy
      flash[:notice] = "いいねを削除しました"
      #redirect_to book_path(book)
      redirect_to request.referer
    else
      flash[:notice] = "いいねを削除できませんでした"
      #redirect_to book_path(book)
      redirect_to request.referer
    end
  end

end
