class UsersController < ApplicationController
  def show
    @user = User.find_by(region: params[:region], slug: params[:battletag])
  end
end
