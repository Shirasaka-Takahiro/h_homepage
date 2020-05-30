class HomeController < ApplicationController
  def index
   @work = Work.all
  end

  def show
  end
end
