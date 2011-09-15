class ActivitiesController < ApplicationController
   before_filter :login_required, :only => [:edit, :update, :create]
 

  def index
    @activities = Activity.paginate  :page => params[:page],
                                     :order => 'created_at DESC',
                                     :include => :users
  end

  def show
    @activity = Activity.find(params[:id])
#    @activity.to_json() 试试json
  end

  def new
    @activity = Activity.new
#    @user = logged_in_user
  end

  def create
    @activity = Activity.new(params[:activity])
    if @activity.save
    @activity.users << logged_in_user
    @activity.owner = logged_in_user
#    @activity.user_activityships.find_by_activity_id(@activity.id).update_attribute(:owner, true) #创建者作为拥有者记录
      flash[:notice] = "Congratulations! Your activity has been created!"
      redirect_to activities_path
    else
      flash[:alert] = "Sorry! There is something wrong with you post, please try again."
      render new_activity_path
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(params[:activity])
      flash[:notice] = "Activity has been updated!"
      redirect_to activity_path(@activity)
    else
      render edit_activity_path(@activity)
    end
  end

  
end

