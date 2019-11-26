class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  # skip_before_action :verify_authenticity_token, only: [:create]
  # protect_from_forgery :except => :create
  # before_action :authenticate_user!, :check_user

  def show
    @user = User.find(params[:id])
    @team = Team.find(@user.team_id)
    @teams = Team.all.order("created_at DESC")
    @stocks = Array.new
    Holding.where(team_id: @user.team_id).each do |holding|
      stock = Stock.find(holding.stock_id)
      @stocks.push({
        "quantity" => holding.quantity,
        "ticker" => stock.ticker,
        "price" => stock.price.to_i,
        "total" => stock.price.to_i * holding.quantity
      })
    end
    @stocks = @stocks.sort_by{ |k| k["total"] }.reverse
    @suggestions = @team.suggestions.paginate(page: params[:page], :per_page => 8)

  end

  def index
    @users = User.all
  end

  private

    def check_user
      if current_user != User.find(params[:id])
        redirect_to login_path, alert: "Please login to access your homepage."
      end
    end

end
