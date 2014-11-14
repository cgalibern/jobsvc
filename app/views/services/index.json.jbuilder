json.array!(@services) do |service|
  json.extract! service, :id, :svcname, :status
  json.url service_url(service, format: :json)
end
