class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :prepare_team

  def prepare_team
    @team = Team.find(current_user.team_id)
  end

  #Voting - acts_as_votable: https://www.cryptextechnologies.com/blogs/voting-functionality-in-ruby-on-rails-app
  def upvote
    @suggestion.upvote_from current_user
    redirect_to current_user
  end

  def downvote
    @suggestion.downvote_from current_user
    redirect_to current_user
  end

  # only called by the upvote method above
  def execute
    
    if @suggestion.quantity < 0
      # sell 
      @holding = Holding.find_by(team_id: @team.id, stock_id: @stock.id)
      if @holding != nil
        res = @holding.update(:quantity, @holding.quantity + @suggestion.quantity)
        if res == false
          redirect_to @suggestion, alert: "Invalid quantity." and return
        end
        @team.update(:balance, @team.balance - @stock.price * @suggestion.quantity)
        @team.update(:value, @team.value + @stock.price * @suggestion.quantity)        
      end
    
    else
      # buy
      res = @team.update(:balance, @team.balance - @stock.price * @suggestion.quantity)
      if res == false
        redirect_to @suggestion, alert: "Insufficient Balance." and return
      end
      @team.update(:value, @team.value + @stock.price * @suggestion.quantity)
      
      @holding = Holding.find_by(team_id: @team.id, stock_id: @stock.id)
      if @holding != nil
        @holding.update(:quantity, @holding.quantity + @suggestion.quantity)
      else
        @holding = Holding.create(team_id: @team.id, stock_id: @stock.id, quantity: @suggestion.quantity)
      end
    end
    
    # if the above operations have been successfully executed or the holding to sell doesn't exist
    redirect_to current_user, notice: 'Suggestion was successfully executed.'
    @suggestion.destroy
    
  end

  # GET /suggestions/new
  def new
    @suggestion = Suggestion.new
  end

  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = @team.suggestions.build(suggestion_params)
    @suggestion.user_id = current_user.id

    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to @suggestion, notice: 'Suggestion was successfully created.' }
        format.json { render :show, status: :created, location: @suggestion }
      else
        format.html { render :new }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggestions/1
  # DELETE /suggestions/1.json
  def destroy
    @suggestion.destroy
    respond_to do |format|
      format.html { redirect_to suggestions_url, notice: 'Suggestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggestion
      @suggestion = Suggestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_params
      params.require(:suggestion).permit(:quantity, :team_id, :user_id, :ticker)
    end
end
