json.array!(@centroscomercials) do |centroscomercial|
  json.extract! centroscomercial, :id, :nome, :cidade_id
  json.url centroscomercial_url(centroscomercial, format: :json)
end
