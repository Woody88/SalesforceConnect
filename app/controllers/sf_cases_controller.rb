class SfCasesController < ApplicationController
  before_action :set_sf_case, only: [:show, :edit, :update, :destroy]

  # GET /sf_cases
  # GET /sf_cases.json
  def index
      @sf_cases = SFCase.all
  end

  # GET /sf_cases/1
  # GET /sf_cases/1.json
  def show
  end

  # GET /sf_cases/new
  def new
    @sf_case = SFCase.new
  end

  # GET /sf_cases/1/edit
  def edit
  end

  # POST /sf_cases
  # POST /sf_cases.json
  def create
    @sf_case = SFCase.create(sf_case_params.to_h.symbolize_keys)
    respond_to do |format|
      if @sf_case.sf_valid?
        format.html { redirect_to @sf_case, notice: 'Sf case was successfully created.' }
        format.json { render :show, status: :created, location: @sf_case.Id }
      else
        format.html { render :new, flash: {:errors => @sf_case.errors.messages} }
        format.json { render json: @sf_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sf_cases/1
  # PATCH/PUT /sf_cases/1.json
  def update
    h = sf_case_params.to_h
    h[:Id] = params[:id]
    @sf_case = SFCase.update(h.symbolize_keys)
    respond_to do |format|
      if @sf_case.sf_valid?
        format.html { redirect_to @sf_case, notice: 'Sf case was successfully updated.' }
        format.json { render :show, status: :ok, location: @sf_case }
      else
        format.html { redirect_to "/sf_cases/#{@sf_case.Id}/edit", flash: {:errors => @sf_case.errors.messages} }
        format.json { render json: @sf_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sf_cases/1
  # DELETE /sf_cases/1.json
  def destroy
    SFCase.destroy(params["id"])
    respond_to do |format|
      format.html { redirect_to "/sf_cases", notice: 'Sf case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sf_case
      @sf_case = SFCase.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sf_case_params
      params.require(:sf_case).permit(SFCase.attributes)
    end
end
