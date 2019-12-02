json.extract! result, :id, :quiz_id, :quiz_result, :created_at, :updated_at
json.url result_url(result, format: :json)