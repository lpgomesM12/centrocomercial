class SiteController < ApplicationController
  def index

   @produtos = Produto.all

  end
end
