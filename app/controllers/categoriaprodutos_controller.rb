class CategoriaprodutosController < ApplicationController
  before_action :set_categoriaproduto, only: [:show, :edit, :update, :destroy]

  def busca_categoria

    if params[:father_id]  
       @categoriaprodutos = Categoriaproduto.where(father_id: params[:father_id])
   else
    
       @categoriaprodutos = Categoriaproduto.where(father_id: nil)    
  end

  render :json => @categoriaprodutos 
  
  end 
  # GET /categoriaprodutos
  # GET /categoriaprodutos.json
  def index
    @categoriaprodutos = Categoriaproduto.all
  end

  # GET /categoriaprodutos/1
  # GET /categoriaprodutos/1.json
  def show
  end

  # GET /categoriaprodutos/new
  def new
    @categoriaproduto = Categoriaproduto.new
  end

  # GET /categoriaprodutos/1/edit
  def edit
  end

  # POST /categoriaprodutos
  # POST /categoriaprodutos.json
  def create
    @categoriaproduto = Categoriaproduto.new(categoriaproduto_params)

    respond_to do |format|
      if @categoriaproduto.save
        format.html { redirect_to @categoriaproduto, notice: 'Categoriaproduto was successfully created.' }
        format.json { render :show, status: :created, location: @categoriaproduto }
      else
        format.html { render :new }
        format.json { render json: @categoriaproduto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoriaprodutos/1
  # PATCH/PUT /categoriaprodutos/1.json
  def update
    respond_to do |format|
      if @categoriaproduto.update(categoriaproduto_params)
        format.html { redirect_to @categoriaproduto, notice: 'Categoriaproduto was successfully updated.' }
        format.json { render :show, status: :ok, location: @categoriaproduto }
      else
        format.html { render :edit }
        format.json { render json: @categoriaproduto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoriaprodutos/1
  # DELETE /categoriaprodutos/1.json
  def destroy
    @categoriaproduto.destroy
    respond_to do |format|
      format.html { redirect_to categoriaprodutos_url, notice: 'Categoriaproduto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoriaproduto
      @categoriaproduto = Categoriaproduto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoriaproduto_params
      params.require(:categoriaproduto).permit(:nome, :father_id, :centroscomercial_id, :descricao)
    end
end
