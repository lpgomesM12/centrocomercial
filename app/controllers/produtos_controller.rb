class ProdutosController < ApplicationController
  
 before_action :authenticate_user!, :except => [:buscaprodutos,:BuscaCategorias, :BuscaProduto, :busca_todos_produtos_empresa] 
 before_action :set_produto, only: [:show, :edit, :update, :destroy]

 # Pesquisa por produto

include ActionView::Helpers::NumberHelper

 def buscaprodutos
    
   # @produtos = Produto.where(categoriaproduto_id: @allperson).page(1).per(6)
    @allperson = [params[:categoria]]
    @categorias = BuscaCategorias(params[:categoria])

    @produtos = Produto.where(categoriaproduto_id: @allperson).page(params[:page]).per(6)
    qtd_produto = Produto.where(categoriaproduto_id: @allperson).count


    json_produtos = @produtos.map { |item| {:id => item.id,
                                                   :nome => item.nome,
                                                   :titulo => item.tituloanuncio,
                                                   :fotos =>  item.fotoproduto.first.imagem.url(:thumb),
                                                   :qtd_produtos => qtd_produto}}
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
                      :empresa_id => @produto.empresa.id,
                      :precoatacado => number_to_currency(@produto.precoatacado, unit: "R$", separator: ",", delimiter: ""),
                      :precovarejo => number_to_currency(@produto.precovarejo, unit: "R$", separator: ",", delimiter: ""),
                      :descricao => @produto.descricao,
                      :titulo => @produto.tituloanuncio,
                      :fotos =>  fotoproduto}

   render :json => json_produto

end


def busca_todos_produtos_empresa
  
  @produtos = Produto.where(empresa_id: params[:empresa_id])
  
  json_produtos = @produtos.map { |item| {:id => item.id,
                                          :nome => item.nome,
                                          :nomeempresa => item.empresa.nome,
                                          :empresa_id => item.empresa.id,
                                          :precoatacado => number_to_currency(item.precoatacado, unit: "R$", separator: ",", delimiter: ""),
                                          :precovarejo => number_to_currency(item.precovarejo, unit: "R$", separator: ",", delimiter: ""),
                                          :descricao => item.descricao,
                                          :titulo => item.tituloanuncio,
                                          :fotos =>  item.fotoproduto.map { |e| e.imagem.url(:medium)}}}
  render :json => json_produtos

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
