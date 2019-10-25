json.extract! portfolio, :id, :portfolio_name, :portfolio_value, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)
