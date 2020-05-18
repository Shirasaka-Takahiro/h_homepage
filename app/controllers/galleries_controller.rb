class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find_by(params[:id])
  end

  def new
    @gallery = Gallery.new
    @gallery = current_user.galleries.build
  end

  def edit
  end
end
