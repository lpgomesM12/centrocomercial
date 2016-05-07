class ProdutosController < ApplicationController
  
 before_action :authenticate_user!, :except => [:buscaprodutos,:BuscaCategorias, :BuscaProduto] 
 before_action :set_produto, only: [:show, :edit, :update, :destroy]

 # Pesquisa por produto


 def buscaprodutos
    
    @produtos = Produto.where(categoriaproduto_id: @allperson)
    @allperson = [params[:categoria]]
    @categorias = BuscaCategorias(params[:categoria])

    @produtos = Produto.where(categoriaproduto_id: @allperson)

    json_produtos = @produtos.map { |item| {:id => item.id,
                                                             :nome => item.nome,
                                                             :titulo => item.tituloanuncio,
                                                             :fotos =>  item.fotoproduto.first.imagem.url(:thumb)}}
   render :json => json_produtos
 end


def BuscaCategorias(id)
   categoriaprodutos = Categoriaproduto.where(father_id: id)

    if categoriaprodutos
      categoriaprodutos.each do |categoria|     
        @allperson += [categoria.id]
        BuscaCategorias(categoria)
      end
    end

end

def BuscaProduto

   @produto = Produto.find(params[:produto_id]) 
   @fotosproduto = Fotoproduto.where(produto_id: params[:produto_id])
   fotoproduto = @fotosproduto.map {|item| item.imagem.url(:medium)}

   json_produto =    {:id => @produto.id,
                      :nome => @produto.nome,
                      :nomeempresa => @produto.empresa.nome,
                      :precoatacado => @produto.precoatacado,
                      :precovarejo => @produto.precovarejo,
                      :descricao => @produto.descricao,
                      :titulo => @produto.tituloanuncio,
                      :fotos =>  fotoproduto}

   render :json => json_produto

end

  

  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.all
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
    @produto.fotoproduto.build
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto was successfully created.' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: 'Produto was successfully updated.' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:nome, :tituloanuncio, :precoatacado, :precovarejo, :descricao, :qtd_atacado, :categoriaproduto_id, :empresa_id, :user_id, fotoproduto_attributes: [:id, :_destroy, :imagem])
    end
end
