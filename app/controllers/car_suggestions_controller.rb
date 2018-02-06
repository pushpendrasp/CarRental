class CarSuggestionsController < ApplicationController
  before_action :set_car_suggestion, only: [:show, :edit, :update, :destroy]
  before_action :authorize_customer
  before_action :authorize_admin, only: [:index, :edit, :update, :destroy]
  # GET be/car_suggestions
  # GET /car_suggestions.json
  def index
    @car_suggestions = CarSuggestion.all
  end

  # GET /car_suggestions/1
  # GET /car_suggestions/1.json
  def show
  end

  # GET /car_suggestions/new
  def new
    @car_suggestion = CarSuggestion.new
  end

  # GET /car_suggestions/1/edit
  def edit
  end

  # POST /car_suggestions
  # POST /car_suggestions.json
  def create
    @car_suggestion = CarSuggestion.new(car_suggestion_params)

    respond_to do |format|
      if @car_suggestion.save
        format.html { redirect_to @car_suggestion, notice: 'Car suggestion was successfully created.' }
        format.json { render :show, status: :created, location: @car_suggestion }
      else
        format.html { render :new }
        format.json { render json: @car_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car_suggestions/1
  # PATCH/PUT /car_suggestions/1.json
  def update
    respond_to do |format|
      if @car_suggestion.update(car_suggestion_params)
        format.html { redirect_to @car_suggestion, notice: 'Car suggestion was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_suggestion }
      else
        format.html { render :edit }
        format.json { render json: @car_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_suggestions/1
  # DELETE /car_suggestions/1.json
  def destroy
    @car_suggestion.destroy
    respond_to do |format|
      format.html { redirect_to car_suggestions_url, notice: 'Car suggestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_suggestion
      @car_suggestion = CarSuggestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_suggestion_params
      params.require(:car_suggestion).permit(:model, :manufacturer, :style)
    end
end
