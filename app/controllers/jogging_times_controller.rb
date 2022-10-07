class JoggingTimesController < ApplicationController
  before_action :set_jogging_time, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /jogging_times
  def index
    @jogging_times = JoggingTime.all

    render json: @jogging_times
  end

  # GET /jogging_times/1
  def show
    render json: @jogging_time
  end

  # POST /jogging_times
  def create
    @jogging_time = JoggingTime.new(jogging_time_params)

    if @jogging_time.save
      render json: @jogging_time, status: :created, location: @jogging_time
    else
      render json: @jogging_time.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jogging_times/1
  def update
    if @jogging_time.update(jogging_time_params)
      render json: @jogging_time
    else
      render json: @jogging_time.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jogging_times/1
  def destroy
    @jogging_time.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jogging_time
      @jogging_time = JoggingTime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jogging_time_params
      params.fetch(:jogging_time, {})
    end
end
