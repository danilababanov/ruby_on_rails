json.extract! post, :id, :title, :description, :publishing, :created_at, :updated_at
json.url post_url(post, format: :json)
