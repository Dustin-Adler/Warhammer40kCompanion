class ModelsController < ApplicationController
  before_action :set_model, only: %i[ show edit update destroy ]

  # GET /models or /models.json
  def index
    @models = Model.all
  end

  # GET /models/1 or /models/1.json
  def show
  end

  # GET /models/new
  def new
    @model = Model.new
  end

  # GET /models/1/edit
  def edit
  end

  # POST /models or /models.json
  def create
    @model = Model.new(model_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to @model, notice: "Model was successfully created." }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1 or /models/1.json
  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to @model, notice: "Model was successfully updated." }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1 or /models/1.json
  def destroy
    @model.destroy!

    respond_to do |format|
      format.html { redirect_to models_path, status: :see_other, notice: "Model was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def model_params
      params.expect(model: [ :name, :description, :movement, :cost, :min_squad, :max_squad, :unit_limit, :toughness, :armour_save, :invuln_save, :wounds, :leadership, :obj_control ])
    end
end
