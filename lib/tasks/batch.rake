# encoding: UTF-8
namespace :batch do

  desc "Scraping Ticket Prices"
  task(:start_scraping => :environment) do
    job = ScrapingJob.new
    job.perform
  end
end