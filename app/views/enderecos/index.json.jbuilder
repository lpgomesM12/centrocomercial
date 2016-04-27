json.array!(@enderecos) do |endereco|
  json.extract! endereco, :id, :endereco, :numero, :cep, :complemento, :cidade_id, :latitude, :longitude
  json.url endereco_url(endereco, format: :json)
end
