json.array!(@registry_participants) do |registry_participant|
  json.extract! registry_participant, :id, :registry_id, :participant_id
  json.url registry_participant_url(registry_participant, format: :json)
end
