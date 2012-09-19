class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_profile, :only => [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @profile.update_attributes(params[:profile])
    if @profile.save
      redirect_to edit_user_profile_path(@profile), notice: "Profile was successfully updated."
    else
      render :edit
    end
  end

  protected
    def set_profile
      @profile = current_user.profile
    end
end
