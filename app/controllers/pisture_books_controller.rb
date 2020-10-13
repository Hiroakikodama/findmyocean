class PistureBooksController < ApplicationController
  def new
    @picture_book = PictureBook.new
  end

  def create
    @picture_book = PictureBook.new(picture_book_params)
    @picture_book.user_id = current_user.id
    if @picture_book.save
      redirect_to picture_book_path(@picture_book.id)
    else
      render :index
    end
  end

  def index
    @picture_books = PictureBook.page(params[:oage]).reverse_order
    @picture_book = PictureBook.new
  end

  def show
    @picture_book = PictureBook.find(params[:id])
  end

  def edit
    @picture_book = PictureBook.find(params[:id])
  end

  def update
    @picture_book = PictureBook.find(params[:id])
    @picture_book.update(picture_book_params)
    redirect_to picture_book_path(@picture_book.id)
  end

  def destroy
    @picture_book = PictureBook.find(params[:id])
    @picture_book.destroy
    redirect_to picture_books_path
  end

  private
  def picture_book_params
    params.require(:picture_book).permit(:user_id, :point, :discription, :fish_name, :image)
  end
end
