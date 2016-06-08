json.array!(@coordinators) do |coordinator|
  json.extract! coordinator, :id, :email, :name, :phone
  json.url coordinator_url(coordinator, format: :json)
end
