class ScrapingsController < ApplicationController
  before_action :set_scraping, only: [:show, :edit, :update, :destroy]

  # GET /scrapings
  # GET /scrapings.json
  def index
    @scrapings = Scraping.all
  end

  # GET /scrapings/1
  # GET /scrapings/1.json
  def show
  end

  # GET /scrapings/new
  def new
    @scraping = Scraping.new
  end

  # GET /scrapings/1/edit
  def edit
  end

  # POST /scrapings
  # POST /scrapings.json
  def create
    @scraping = Scraping.new(scraping_params)

    respond_to do |format|
      if @scraping.save
        format.html { redirect_to @scraping, notice: 'Scraping was successfully created.' }
        format.json { render :show, status: :created, location: @scraping }
      else
        format.html { render :new }
        format.json { render json: @scraping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scrapings/1
  # PATCH/PUT /scrapings/1.json
  def update
    respond_to do |format|
      if @scraping.update(scraping_params)
        format.html { redirect_to @scraping, notice: 'Scraping was successfully updated.' }
        format.json { render :show, status: :ok, location: @scraping }
      else
        format.html { render :edit }
        format.json { render json: @scraping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrapings/1
  # DELETE /scrapings/1.json
  def destroy
    @scraping.destroy
    respond_to do |format|
      format.html { redirect_to scrapings_url, notice: 'Scraping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraping
      @scraping = Scraping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scraping_params
      params.require(:scraping).permit(:scraping, :position, :exchange_office_id, :money_id, :form_id, :price_type_id)
    end
end
