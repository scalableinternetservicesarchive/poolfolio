class UsersController < ApplicationController

  before_action :authenticate_user!, :check_user, :set_teams

  def show
    # "stocks" structure combines stock price from Stock and quantity from Holding
    @stocks = Array.new
    Holding.where(team_id: current_user.team_id).each do |holding|
      stock = Stock.find(holding.stock_id)
      @stocks.push({
        "quantity" => holding.quantity,
        "ticker" => stock.ticker,
        "price" => stock.price.to_i,
        "total" => stock.price.to_i * holding.quantity
      })
    end
    @stocks = @stocks.sort_by{ |k| k["total"] }.reverse

    # Unoptimized
    @suggestions = Suggestion.where(team_id: current_user.team_id)

  end

  def index
    @users = User.all
  end

  private

    def set_teams
      @team = Team.find(current_user.team_id)
      @teams = Team.all.sort_by{ |team| team.balance + team.value}.reverse
    end

    def check_user
      if current_user != User.find(params[:id])
        redirect_to login_path, alert: "Please login to access your homepage."
      end
    end

end
