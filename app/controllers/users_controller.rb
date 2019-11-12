class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @teams = Team.all.order("created_at DESC")
    @team = Team.find(@user.team_id)
    @stocks = Array.new
    Holding.where(team_id: @user.team_id).each do |holding|
      stock = Stock.find(holding.stock_id)
      @stocks.push({
        "quantity" => holding.quantity,
        "ticker" => stock.ticker,
        "price" => stock.price,
        "total" => stock.price * holding.quantity
      })
    end
    @stocks = @stocks.sort_by{ |k| k["total"] }.reverse

    @suggestions = Suggestion.where(team_id: @user.team_id)

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
