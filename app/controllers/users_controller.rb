class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @teams = Team.all.order("created_at DESC")
  end


  def index
    @users = User.all
  end

  before_action :authenticate_user!, :check_user

  private

    def check_user
      if current_user != User.find(params[:id])
        redirect_to login_path, alert: "Please login to access your homepage."

      end
    end
end
