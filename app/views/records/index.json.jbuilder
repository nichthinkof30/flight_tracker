json.array!(@records) do |record|
  json.extract! record, :id, :lowest, :highest, :tracker_id
  json.url record_url(record, format: :json)
end
