namespace :update do
  # Testing functionality using a single stock
  desc "Update Miscrosoft stock price"
  # :environment loads entire Rails application before task is run
  task update_msft: :environment do
    puts "Updating MSFT stock price..."

    # Obtain price of MSFT using AlphaVantage API
    res = RestClient.get("https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=MSFT&apikey=YNKAKVYRW2VHVAV1")
    res = JSON.parse(res)
    res_price = res["Global Quote"]["05. price"]

    # Update MSFT with new price
    msft = Stock.where(ticker: "MSFT")[0]
    msft.price = res_price.to_i
    msft.save # "save" instead of "update_attribute", since the latter does not update the "updated_at" field

    puts "#{Time.now} - Updated MSFT stock price to: " + res_price
  end

  # The actual stock update task
  desc "Update all stocks currently being held by any team, and concurrently updates team values"
  task update_stocks: :environment do
    teams = Team.all
    for team in teams do

      puts "--------------------------> Updating " + team.name + "'s stocks..."

      holdings = Holding.where(team_id: team.id)
      new_team_value = 0 # For adding up the team's new value from each holding
      for holding in holdings do
        stock = Stock.find(holding.stock_id)

        # Every only update the stock if it has been stale for over n minutes
        if stock.updated_at < 1.minutes.ago || stock.price == nil
          # Obtain price of stock using AlphaVantage API
          res = RestClient.get("https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=" + stock.ticker + "&apikey=YNKAKVYRW2VHVAV1")
          res = JSON.parse(res)
          res_price = res["Global Quote"]["05. price"]

          # Update stock with new price
          stock.price = res_price.to_i
          stock.save # "save" instead of "update_attribute", since the latter does not update the "updated_at" field
          stock.touch # "save" only updates "updated_at" field if changes were made, "touch" guarantees "updated_at" is updated

          puts "#{Time.now} - Updated " + stock.ticker + "'s stock price to: " + res_price
        end

        # Add up the team's holding values
        new_team_value += holding.quantity * stock.price
      end
      team.value = new_team_value
      team.save

      puts "#{Time.now} - Done. " + team.name + "'s new value: " + new_team_value.to_s

    end
  end

end
