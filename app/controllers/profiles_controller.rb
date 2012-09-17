class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update_attributes(params[:profile])
    if @profile.save
      redirect_to edit_user_profile_path(@profile), notice: "Profile was successfully updated."
    else
      render :edit
    end
  end
end
