
# Check so that each newly spawned EB instance doesn't try to seed and already seeded database
if Team.all.size == 0
    # Default team which every new user joins
    first_team = Team.create(name: "The Quants", balance: 4000)
    first_user = User.create(firstname: "Jack", lastname: "Zhang", email: "jz@ucla.edu", password: "qwerty", password_confirmation: "qwerty", team_id: 1)
    second_user = User.create(firstname: "Pierson", lastname: "Marks", email: "pm@ucla.edu", password: "qwerty", password_confirmation: "qwerty", team_id: 1)
    third_user = User.create(firstname: "Hanyo", lastname: "Liu", email: "hl@ucla.edu", password: "qwerty", password_confirmation: "qwerty", team_id: 1)
    fourth_user = User.create(firstname: "Nikita", lastname: "Luyanenko", email: "nikita1923666@gmai.com", password: "warlords", password_confirmation: "warlords", team_id: 1)

    # Stocks using Alpaca's Market API
    res = RestClient.get("https://paper-api.alpaca.markets/v2/assets", :"APCA-API-KEY-ID" => "PKI9MD0KBM4B957XF9IJ", :"APCA-API-SECRET-KEY" => "DxnPxsIzEZDwFcgfnlHoSKhkKFsfEgsHFkggmcQx")
    res = JSON.parse(res)
    for stock in res do
        if (stock["exchange"] == "NYSE" || 
            stock["exchange"] == "AMEX" || 
            stock["exchange"] == "NASDAQ") && 
            stock["tradable"] == true
            Stock.create(ticker: stock["symbol"], exchange: stock["exchange"])
        end
    end
end

