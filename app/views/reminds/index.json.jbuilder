json.array!(@reminds) do |remind|
  json.extract! remind, :name, :date, :time, :contactmethod, :contactinfo, :message, :timecreated
  json.url remind_url(remind, format: :json)
end