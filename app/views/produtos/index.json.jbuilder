json.array!(@produtos) do |produto|
  json.extract! produto, :id, :nome, :tituloanuncio, :precoatacado, :precovarejo, :descricao, :qtd_atacado, :categoriaproduto_id
  json.url produto_url(produto, format: :json)
end
