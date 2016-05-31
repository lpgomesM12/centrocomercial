class FotoprodutosController < ApplicationController
 before_action :set_fotoproduto, only: [:show, :edit, :update, :destroy]

  
  def busca_fotos_produto

    @fotoprodutos = Fotoproduto.where(produto_id: params[:produto_id])
    
     json_fotoproduto = @fotoprodutos.map { |item| {:id => item.id,
                                                   :imagem =>  item.imagem.url(:medium)}}
    render :json => json_fotoproduto

  end 

  # POST /estados
  # POST /estados.json
  def create
  	#debugger 
    @fotoproduto = Fotoproduto.new(fotoproduto_params)
    @fotoproduto.imagem =  params[:file]

      if @fotoproduto.save
         render json: true
      else
       render json: @fotoproduto_file.errors      
       end
  end


 def deleta 
  @fotoproduto = Fotoproduto.find(params[:id])
  @fotoproduto.destroy
  render json: true
 end 
 

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_fotoproduto
      @fotoproduto = Fotoproduto.find(params[:id])
  end

  def fotoproduto_params
      params.require(:fotoproduto).permit(:produto_id, :imagem)
  end
end
