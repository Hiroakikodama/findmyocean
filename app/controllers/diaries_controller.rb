class DiariesController < ApplicationController
  def new
    @diary = Diary.new
  end

  def create
    @diary = current_user.diaries.build(doary_params)
    if @diary.save
      redirect_to diary_path(@diary.id)
    else
      @diaris = Diary.all
      @user = current_user
      render :index
    end
  end

  def index
    @diary = Diary.page(params[:page]).reverse_order
    @diary = Diary.new
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    @diary.update(diary_params)
    redirect_to diary_path(@diary.id)
  end

  def show
    @diary = Diary.find(params[:id])
    @diary_images = @diary.diary_images
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_path
  end

  private
  def diary_params
    params.require(:diary).permit(:user_id, :title, :body, :diary_images: [])
  end
end
