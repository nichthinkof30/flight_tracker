class User < ActiveRecord::Base
  has_many :trackers, dependent: :destroy

  accepts_nested_attributes_for :trackers
end
