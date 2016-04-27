json.array!(@empresas) do |empresa|
  json.extract! empresa, :id, :nome, :cnpj, :centroscomercial_id, :informacao, :fraseempresa, :endereco_id
  json.url empresa_url(empresa, format: :json)
end
