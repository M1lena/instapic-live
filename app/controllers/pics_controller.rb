class PicsController < ApplicationController
  def index
    @pics = Pic.all
  end

  def new
    @pic = Pic.new
  end

  def create
    Pic.create(pic_params)
    redirect_to '/pics'
  end

  def show
    @pic = Pic.find(params[:id])
  end

  def destroy
    @pic = Pic.find(params[:id])
    @pic.destroy
    flash[:notice] = 'pic deleted successfully!'
    redirect_to '/pics'
  end

  def pic_params
    params.require(:pic).permit(:message)
  end
end
