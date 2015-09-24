class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @profiles = Profile.page(params[:page])
  end

  def show
    @profile = Profile.find(params[:id])
    @packages = Package.where(profile_id: params[:id])
  end

  def new
    has_profile?(current_user)
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      flash[:notice] = "profile Saved"
      redirect_to profile_path(@profile)
    else
      flash[:notice] = "Invalid Input"
      render :new
    end
  end

  def edit
    access_to_profile?(current_user)
  end

  def update
    access_to_profile?(current_user)
    if @profile.update(profile_params)
      flash[:notice] = "Profile information updated"
      redirect_to profile_path
    else
      flash[:notice] = "Invalid profile submission"
      render :edit
    end
  end

  def destroy
    access_to_profile?(current_user)
    if @profile.destroy
      flash[:notice] = "Profile successfully deleted"
      redirect_to root_path
    else
      flash[:notice] = "Profile was not deleted"
    end
  end

  def access_to_profile?(current_user)
    profile = Profile.find(params[:id]).user.id
    if current_user.admin || current_user.id == profile
      @profile = Profile.find(params[:id])
    else
      flash[:notice] = "You do not have access to this profile"
      redirect_to root_path
    end
  end

  def has_profile?(current_user)
    @profile = Profile.where(user_id: current_user)
    if @profile != []
      redirect_to profile_path(@profile[0].id)
    else
      @profile = Profile.new
    end
  end

  protected
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :location,
      :years_experience, :user_id)
  end

end
