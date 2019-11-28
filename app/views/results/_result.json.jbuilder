json.extract! result, :id, :quiz_id, :user, :quiz_result, :created_at, :updated_at
json.url result_url(result, format: :json)
