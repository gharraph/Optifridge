class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    warn params[:file].inspect
    @image = Image.new(:file => params[:file])
    warn "**********************"
    warn @image.inspect
    @image.save
    flash[:notice] = "Image uploaded, yo!"
  end
end