class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all

    if params[:tag_name]
       @galleries = Gallery.tagged_with("#{params[:tag_name]}")
    end
  end

  def tag
    @galleries = Gallery.tagged_with(params[:name])
    @tags = Gallery.tag_counts_on(:tags)
    
    render 'index'
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

  def update
    @gallery = Gallery.find(params[:id])
    @gallery.update!(gallery_params)
    flash[:notice] = "#{@gallery.title}を更新しました"
    redirect_to galleries_url
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
    params.require(:gallery).permit(:title, :content, :image, :tag_list)
  end

end
