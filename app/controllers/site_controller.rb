class SiteController < ApplicationController
  
  layout "layoutSite"

  def index
   @produtos = Produto.all
  end
  
  def showproduto
  	
  end
  
end
