class Tracker < ActiveRecord::Base
  belongs_to :user
  has_many :records

  LOCATION_FROM = [
    ["Kuala Lumpur (KUL)", "KUL"]
  ]

  LOCATION_TO = [
    ["Seoul (ICN)", "ICN"]
  ]

end
