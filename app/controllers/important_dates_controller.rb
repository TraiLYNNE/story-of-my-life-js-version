class ImportantDatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_idate, only: [:edit, :update, :destroy]

  def new
    @idate = ImportantDate.new(chapter_id: params[:chapter_id])
  end

  def create
    @idate = ImportantDate.new(important_dates_params)

    if @idate.valid?
      @idate.save

      redirect_to chapter_path(@idate.chapter), alert: "Date successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @idate.update(important_dates_params)
      redirect_to chapter_path(@idate.chapter), alert: "Date successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @idate.destroy

    redirect_to chapter_path(@idate.chapter), alert: "Date successfully deleted"
  end

  private

  def set_idate
    @idate = ImportantDate.find(params[:id])
  end

  def important_dates_params
    params.require(:important_date).permit(:title, :date, :chapter_id)
  end
end
