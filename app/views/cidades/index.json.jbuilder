json.array!(@cidades) do |cidade|
  json.extract! cidade, :id, :nome_cidade, :sigl_estado, :flag_ativo, :estado_id
  json.url cidade_url(cidade, format: :json)
end
