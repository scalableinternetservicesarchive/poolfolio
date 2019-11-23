# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :environment, ENV["RAILS_ENV"] # Needed since default environment is always production
set :output, "log/stock_updates.log"

# Alpha Vantage's fre API key is capped at 5 requests per minute, so we run every minute to increase throuhgput
every 1.minute do
    rake "update:update_stocks"
end