class CentroscomercialsController < ApplicationController
  before_action :set_centroscomercial, only: [:show, :edit, :update, :destroy]

  # GET /centroscomercials
  # GET /centroscomercials.json
  def index
    @centroscomercials = Centroscomercial.all
  end

  # GET /centroscomercials/1
  # GET /centroscomercials/1.json
  def show
  end

  # GET /centroscomercials/new
  def new
    @centroscomercial = Centroscomercial.new
  end

  # GET /centroscomercials/1/edit
  def edit
  end

  # POST /centroscomercials
  # POST /centroscomercials.json
  def create
    @centroscomercial = Centroscomercial.new(centroscomercial_params)

    respond_to do |format|
      if @centroscomercial.save
        format.html { redirect_to @centroscomercial, notice: 'Centroscomercial was successfully created.' }
        format.json { render :show, status: :created, location: @centroscomercial }
      else
        format.html { render :new }
        format.json { render json: @centroscomercial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centroscomercials/1
  # PATCH/PUT /centroscomercials/1.json
  def update
    respond_to do |format|
      if @centroscomercial.update(centroscomercial_params)
        format.html { redirect_to @centroscomercial, notice: 'Centroscomercial was successfully updated.' }
        format.json { render :show, status: :ok, location: @centroscomercial }
      else
        format.html { render :edit }
        format.json { render json: @centroscomercial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centroscomercials/1
  # DELETE /centroscomercials/1.json
  def destroy
    @centroscomercial.destroy
    respond_to do |format|
      format.html { redirect_to centroscomercials_url, notice: 'Centroscomercial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_centroscomercial
      @centroscomercial = Centroscomercial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def centroscomercial_params
      params.require(:centroscomercial).permit(:nome, :cidade_id)
    end
end
