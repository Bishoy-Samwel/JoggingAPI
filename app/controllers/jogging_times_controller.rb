# frozen_string_literal: true

class JoggingTimesController < ApplicationController
  before_action :set_jogging_time, only: %i[show update destroy]
  before_action :authenticate_user!
  # around_action :set_week

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
      #todo use a callback function like before_save
      @jogging_time.week = @jogging_time.date.cweek
      @jogging_time.save
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

  def filter
    #todo use a scope for a skinny controller and reusablity
    render json: current_user.jogging_times.where('date >= :start_date AND date <= :end_date', {
      start_date: params[:fromDate], end_date: params[:toDate]
    })
  end

  def report_avg_distance
    #todo use scope
    render json: current_user.jogging_times.group(:week).average(:distance)
  end

  def report_avg_speeds
    #todo use scope
    speeds = current_user.jogging_times.select(("distance/time"))
    # render json: current_user.jogging_times.group(:week).average('distance/time')
    render json: speeds
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_jogging_time
    if policy_scope(JoggingTime).find(params[:id]).present?
      @jogging_time = policy_scope(JoggingTime).find(params[:id])
    else
      render json: { error: 'Unauthorized request' }, status: 401
    end
  end

  # Only allow a list of trusted parameters through.
  def jogging_time_params
    # params.fetch(:jogging_time, {})
    params.require(:jogging_time).permit(:distance, :date, :time)
  end
end
