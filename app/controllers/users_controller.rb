class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:battletag])
  end
end
