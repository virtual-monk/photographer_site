class PackagesController < ApplicationController

  def new
    @profile = Profile.find(params[:profile_id])
    @package = Package.new
  end

  def create
    @package = Package.new(package_params)
    # binding.pry
    @package.profile = Profile.find(params[:profile_id])
    if @package.save
      flash[:notice] = "Package Saved"
      redirect_to profile_path(@package.profile)
    else
      flash[:notice] = "Invalid Input"
      render :new
    end
  end

  def edit
    access_to_package?(current_user)
  end

  def update
    access_to_package?(current_user)
    if @package.update(package_params)
      flash[:notice] = "Package information updated"
      redirect_to profile_path(@profile)
    else
      flash[:notice] = "Invalid package submission"
      render :edit
    end
  end

  def destroy
    access_to_package?(current_user)
    if @package.destroy
      flash[:notice] = "Package sucessfully deleted"
      redirect_to profile_path(@profile)
    else
      flash[:notice] = "Package was not deleted"
    end
  end

  def access_to_package?(current_user)
    package = Package.find(params[:id]).profile.user.id
    if current_user.admin || current_user.id == package
      @package = Package.find(params[:id])
      @profile = Profile.find(params[:profile_id])
    else
      flash[:notice] = "You do not have access to this profile"
      redirect_to root_path
    end
  end

  protected
  def package_params
    params.require(:package).permit(:title, :details, :price, :package_id)
  end
end
