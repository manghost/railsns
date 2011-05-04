class PagesController < ApplicationController

  def index
    @pages = Page.find(:all)
  end

  def show
    @page = Page.find(params[:id].to_i)
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    @page.save
    if @page.save
      flash[:notice] = "Create Successful!"
      redirect_to :action => :index
    else
      flash[:alert] = "Please try again!"
      render :action => :new
    end
  end

  def edit
    @page = Page.find(params[:id].to_i)
  end

  def update
    @page = Page.find(params[:id].to_i)
    @page.update_attributes(params[:page])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Update successful!"
      redirect_to :action=> :index
    else
      flash[:alert] = "Please try again!"
      render :action => :edit
    end
  end
  def destroy
    @page = Page.find(params[:id].to_i)
    if @page.destroy
      flash[:notice] = "Page deleted"
    else
      flash[:alert] = "Some goes wrong when deleting the page!"
    end
    redirect_to :action => :index
    
  end
end
