Rails.application.routes.draw do
  get 'site/index'

  resources :produtos
  resources :categoriaprodutos
  resources :telefones
  resources :empresas
  resources :centroscomercials
  resources :enderecos
  resources :cidades
  resources :estados
  resources :fotoprodutos
  devise_for :users
  

  root 'site#index'

  get 'static_pages/index'
  match '/listarCidade', to: 'cidades#get_cities', via: 'get'
  match '/buscaprodutos', to: 'produtos#buscaprodutos', via: 'get'
  match '/buscaproduto', to: 'produtos#BuscaProduto', via: 'get'
  match '/buscaprodutosempresa', to: 'produtos#busca_todos_produtos_empresa', via: 'get'
  match '/buscacategoria', to: 'categoriaprodutos#busca_categoria', via: 'get'
  match '/buscacategoriafilhas', to: 'produtos#BuscaCategorias', via: 'get'
  match '/deletaFotoProduto', to: 'fotoprodutos#deleta', via: 'get'
  match '/cadastrarProduto', to: 'produtos#cadastrar_produto', via: 'get'
  match '/buscaempresas', to: 'empresas#busca_empresas', via: 'get'
  #match '/salvarfoto', to: 'fotoprodutos#create', via: 'get'
  match '/logar', to: 'userapp#login', via: 'get'
  match '/buscaFotoProduto', to: 'fotoprodutos#busca_fotos_produto', via: 'get'
  match '/showproduto/:id', controller: 'site', action: 'showproduto', via: 'get'


end
