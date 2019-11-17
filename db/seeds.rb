# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Default team which every new user joins
first_team = Team.create()
first_user = User.create(firstname: "Jack", lastname: "Zhang", email: "jz@ucla.edu", password: "qwerty", password_confirmation: "qwerty", team_id: 1)
second_user = User.create(firstname: "Pierson", lastname: "Marks", email: "pm@ucla.edu", password: "qwerty", password_confirmation: "qwerty", team_id: 1)
third_user = User.create(firstname: "Hanyo", lastname: "Liu", email: "hl@ucla.edu", password: "qwerty", password_confirmation: "qwerty", team_id: 1)
fourth_user = User.create(firstname: "Nikita", lastname: "Luyanenko", email: "nl@ucla.edu", password: "qwerty", password_confirmation: "qwerty", team_id: 1)

# Stocks
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



