json.extract! question, :id, :quiz_id, :body, :created_at, :updated_at
json.url question_url(question, format: :json)