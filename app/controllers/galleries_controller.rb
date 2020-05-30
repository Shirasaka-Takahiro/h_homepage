class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
    @gallery = current_user.galleries.build
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def create

    @gallery = current_user.galleries.build(gallery_params)

    if @gallery.save
       redirect_to root_url
       flash[:notice] = "#{@gallery.title}を投稿しました"
    else
       render :new
    end

  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    flash[:notice] = "#{@gallery.title}を削除しました"
    redirect_to galleries_path   
  end

  private
  
  def gallery_params
    params.require(:gallery).permit(:title, :content, :image, :category_ids)
  end

end
