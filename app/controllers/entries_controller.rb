class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: [:show, :destroy]

  def show
  end
  
  def new
    @entry = Entry.new(page_id: params[:page_id])
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.valid?
      @entry.save

      redirect_to entry_path(@entry), alert: "Entry successfully created"
    else
      render :new
    end
  end
  
  def destroy
    @entry.destroy

    redirect_to page_path(@entry.page), alert: "Entry successfully deleted"
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:mood, :content, :page_id)
  end
end
