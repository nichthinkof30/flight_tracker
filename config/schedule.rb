set :output, "#{path}/log/cron.log"
every :day, at: '1:00am', roles: [:app] do
  command ""
end
