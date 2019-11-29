json.extract! question, :id, :quiz_id, :question_num,:body, :body_type, :created_at, :updated_at
json.url question_url(question, format: :json)