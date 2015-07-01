class PicsController < ApplicationController
  def index
    @pics = Pic.all
  end

  def new
  end

  def create
    Pic.create(pic_params)
    redirect_to '/pics'
  end

  def pic_params
    params.require(:pic).permit(:message)
  end
end
