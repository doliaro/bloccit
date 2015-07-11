class AdvertisementsController < ApplicationController
  def index
  	@advertisement = Advertisements.all
  end

  def show
  	@advertisement = Advertisements.find(params[:id])
  end
end
