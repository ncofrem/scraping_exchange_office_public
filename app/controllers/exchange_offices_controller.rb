class ExchangeOfficesController < ApplicationController
  before_action :set_exchange_office, only: [:show, :edit, :update, :destroy]

  # GET /exchange_offices
  # GET /exchange_offices.json
  def index
    @exchange_offices = ExchangeOffice.all
  end

  # GET /exchange_offices/1
  # GET /exchange_offices/1.json
  def show
  end

  # GET /exchange_offices/new
  def new
    @exchange_office = ExchangeOffice.new
  end

  # GET /exchange_offices/1/edit
  def edit
  end

  # POST /exchange_offices
  # POST /exchange_offices.json
  def create
    @exchange_office = ExchangeOffice.new(exchange_office_params)

    respond_to do |format|
      if @exchange_office.save
        format.html { redirect_to @exchange_office, notice: 'Exchange office was successfully created.' }
        format.json { render :show, status: :created, location: @exchange_office }
      else
        format.html { render :new }
        format.json { render json: @exchange_office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exchange_offices/1
  # PATCH/PUT /exchange_offices/1.json
  def update
    respond_to do |format|
      if @exchange_office.update(exchange_office_params)
        format.html { redirect_to @exchange_office, notice: 'Exchange office was successfully updated.' }
        format.json { render :show, status: :ok, location: @exchange_office }
      else
        format.html { render :edit }
        format.json { render json: @exchange_office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exchange_offices/1
  # DELETE /exchange_offices/1.json
  def destroy
    @exchange_office.destroy
    respond_to do |format|
      format.html { redirect_to exchange_offices_url, notice: 'Exchange office was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exchange_office
      @exchange_office = ExchangeOffice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exchange_office_params
      params.require(:exchange_office).permit(:name, :url_page, :message_id, :scraping_done)
    end
end
