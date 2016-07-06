class SiteController < ApplicationController
  
  layout "layoutSite"

  def index
   @produtos = Produto.all
  end
  
  def showproduto 	
  	@fotoprodutos = Fotoproduto.where(produto_id: params[:id])  	
  	@produto = Produto.find(params[:id])
  end
  
end
