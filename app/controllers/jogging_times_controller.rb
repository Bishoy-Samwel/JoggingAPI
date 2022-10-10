# frozen_string_literal: true

class JoggingTimesController < ApplicationController
  before_action :set_jogging_time, only: %i[show update destroy]
  before_action :authenticate_user!

  # GET /jogging_times
  def index
    @jogging_times = policy_scope(JoggingTime).all

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
      current_user.add_role :creator, @jogging_time
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
    if policy_scope(JoggingTime).find(params[:id]).present?
      @jogging_time = policy_scope(JoggingTime).find(params[:id])
    else
      render json: { error: 'Unotharized request' }, status: 401
    end
  end

  # Only allow a list of trusted parameters through.
  def jogging_time_params
    params.fetch(:jogging_time, {})
  end
end
