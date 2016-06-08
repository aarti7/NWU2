json.array!(@participants) do |participant|
  json.extract! participant, :id, :name, :gender, :date_of_birth, :date_of_enrollment, :contact_method, :remarks, :coordinator
  json.url participant_url(participant, format: :json)
end
