json.extract! post, :id, :content, :picture, :hash, :created_at, :updated_at
json.url post_url(post, format: :json)
