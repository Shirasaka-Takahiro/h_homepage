class WorksController < ApplicationController

  def index
    @works = Work.all
    @work = Work.find_by(params[:id])
    @user = User.find_by(params[:id])
  end

  def show
    @work = Work.find_by(params[:id])
  end

  def new
    @work = Work.new
    @work = current_user.works.build
  end

  def edit
  end

  def create
    @work = current_user.works.build(work_params)

    if @work.save
      redirect_to root_url
      flash[:notice] = "#{@work.title}を投稿しました"
    else
      render :new
    end
    
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    flash[:notice] = "#{@work.title}を削除しました"
    redirect_to root_url
  end

  private

  def work_params
    params.require(:work).permit(:title, :image, :content)
  end

end
