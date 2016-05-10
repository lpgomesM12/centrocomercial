Rails.application.routes.draw do
  resources :produtos
  resources :categoriaprodutos
  resources :telefones
  resources :empresas
  resources :centroscomercials
  resources :enderecos
  resources :cidades
  resources :estados
  devise_for :users
  

  root 'static_pages#index'

  get 'static_pages/index'
  match '/listarCidade', to: 'cidades#get_cities', via: 'get'
  match '/buscaprodutos', to: 'produtos#buscaprodutos', via: 'get'
  match '/buscaproduto', to: 'produtos#BuscaProduto', via: 'get'
  match '/buscaprodutosempresa', to: 'produtos#busca_todos_produtos_empresa', via: 'get'
  match '/buscacategoria', to: 'categoriaprodutos#busca_categoria', via: 'get'
  match '/buscacategoriafilhas', to: 'produtos#BuscaCategorias', via: 'get'

end
