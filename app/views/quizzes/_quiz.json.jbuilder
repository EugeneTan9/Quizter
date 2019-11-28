json.extract! quiz, :id, :user_id, :title, :description, :img_url, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
