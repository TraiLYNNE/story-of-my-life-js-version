class ChaptersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @chapter = Chapter.new(book_id: params[:book_id])

    4.times {@chapter.important_dates.build}
  end

  def create
    @chapter = Chapter.new(chapter_params)

    if @chapter.valid?
      @chapter.save

      redirect_to chapter_path(@chapter), alert: "Chapter successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @chapter.update(chapter_params)
      redirect_to chapter_path(@chapter), alert: "Chapter successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @chapter.destroy

    redirect_to book_path(@chapter.book), alert: "Chapter successfully deleted"
  end

  private

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :main_focus, :book_id, important_dates_attributes: [:id, :date, :title])
  end
end
