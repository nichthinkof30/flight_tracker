json.array!(@trackers) do |tracker|
  json.extract! tracker, :id, :origin, :destination, :from_date, :to_date, :user_id
  json.url tracker_url(tracker, format: :json)
end
