json.array!(@responses) do |response|
  json.extract! response, :id, :full_name, :email, :body
  json.url response_url(response, format: :json)
end
