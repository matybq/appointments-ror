json.extract! patient, :id, :name, :sex, :dob, :email, :created_at, :updated_at
json.url patient_url(patient, format: :json)
