json.array!(@sites) do |site|
  json.extract! site, 
  json.url site_url(site, format: :json)
end