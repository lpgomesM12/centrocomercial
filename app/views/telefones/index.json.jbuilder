json.array!(@telefones) do |telefone|
  json.extract! telefone, :id, :numero, :tipo, :empresa_id
  json.url telefone_url(telefone, format: :json)
end
