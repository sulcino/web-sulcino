class MessageOfTheDaysController < ApplicationController
  before_action :set_message_of_the_day, only: %i[ show edit update destroy ]

  load_and_authorize_resource

  # GET /message_of_the_days or /message_of_the_days.json
  def index
    @message_of_the_days = MessageOfTheDay.all
  end

  # GET /message_of_the_days/1 or /message_of_the_days/1.json
  def show
  end

  # GET /message_of_the_days/new
  def new
    @message_of_the_day = MessageOfTheDay.new(user: current_user)
  end

  # GET /message_of_the_days/1/edit
  def edit
  end

  # POST /message_of_the_days or /message_of_the_days.json
  def create
    @message_of_the_day = MessageOfTheDay.new(message_of_the_day_params)

    respond_to do |format|
      if @message_of_the_day.save
        format.html { redirect_to @message_of_the_day, notice: "Message of the day was successfully created." }
        format.json { render :show, status: :created, location: @message_of_the_day }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message_of_the_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_of_the_days/1 or /message_of_the_days/1.json
  def update
    respond_to do |format|
      if @message_of_the_day.update(message_of_the_day_params)
        format.html { redirect_to @message_of_the_day, notice: "Message of the day was successfully updated." }
        format.json { render :show, status: :ok, location: @message_of_the_day }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message_of_the_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_of_the_days/1 or /message_of_the_days/1.json
  def destroy
    @message_of_the_day.destroy!

    respond_to do |format|
      format.html { redirect_to message_of_the_days_path, status: :see_other, notice: "Message of the day was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_of_the_day
      @message_of_the_day = MessageOfTheDay.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def message_of_the_day_params
      prms = params.expect(message_of_the_day: [ :text_en, :text_cs ])
      prms[:user_id] = current_user.id if prms[:message_of_the_day].blank?
      prms
    end
end
