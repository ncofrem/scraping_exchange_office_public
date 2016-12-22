class TypeFormFieldsController < ApplicationController
  before_action :set_type_form_field, only: [:show, :edit, :update, :destroy]

  # GET /type_form_fields
  # GET /type_form_fields.json
  def index
    @type_form_fields = TypeFormField.all
  end

  # GET /type_form_fields/1
  # GET /type_form_fields/1.json
  def show
  end

  # GET /type_form_fields/new
  def new
    @type_form_field = TypeFormField.new
  end

  # GET /type_form_fields/1/edit
  def edit
  end

  # POST /type_form_fields
  # POST /type_form_fields.json
  def create
    @type_form_field = TypeFormField.new(type_form_field_params)

    respond_to do |format|
      if @type_form_field.save
        format.html { redirect_to @type_form_field, notice: 'Type form field was successfully created.' }
        format.json { render :show, status: :created, location: @type_form_field }
      else
        format.html { render :new }
        format.json { render json: @type_form_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_form_fields/1
  # PATCH/PUT /type_form_fields/1.json
  def update
    respond_to do |format|
      if @type_form_field.update(type_form_field_params)
        format.html { redirect_to @type_form_field, notice: 'Type form field was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_form_field }
      else
        format.html { render :edit }
        format.json { render json: @type_form_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_form_fields/1
  # DELETE /type_form_fields/1.json
  def destroy
    @type_form_field.destroy
    respond_to do |format|
      format.html { redirect_to type_form_fields_url, notice: 'Type form field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_form_field
      @type_form_field = TypeFormField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_form_field_params
      params.require(:type_form_field).permit(:name)
    end
end
