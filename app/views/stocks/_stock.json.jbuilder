json.extract! stock, :id, :ticker, :price, :created_at, :updated_at
json.url stock_url(stock, format: :json)
