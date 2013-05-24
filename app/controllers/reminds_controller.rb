require 'rubygems'
# require 'rufus/scheduler'
# scheduler = Rufus::Scheduler.start_new

# scheduler.in "30m"  do 
#     Remind.dowork    
# end
    
class RemindsController < ApplicationController
  before_action :set_remind, only: [:show, :edit, :update, :destroy]

  # GET /reminds
  # GET /reminds.json
  def check
    # Remind.find_reminders_todo
    @sent = Remind.find_reminders_todo
  end

  def index
    @reminds = Remind.all

  end

  # GET /reminds/1
  # GET /reminds/1.json
  def show
  end

  # GET /reminds/new
  def new
    @remind = Remind.new
  end

  # GET /reminds/1/edit
  def edit
  end

  # POST /reminds
  # POST /reminds.json
  def create
    @remind = Remind.new(remind_params)
    respond_to do |format|
      if @remind.save

      # send a welcome email after save
         ReminderMailer.welcome_email(@remind).deliver
        format.html { redirect_to @remind, notice: 'Reminder was successfully created.' }
        format.json { render action: 'show', status: :created, location: @remind }
      else
        format.html { render action: 'new' }
        format.json { render json: @remind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reminds/1
  # PATCH/PUT /reminds/1.json
  def update
    respond_to do |format|
      if @remind.update(remind_params)
        format.html { redirect_to @remind, notice: 'Remind was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @remind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminds/1
  # DELETE /reminds/1.json
  def destroy
    @remind.destroy
    respond_to do |format|
      format.html { redirect_to reminds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remind
      @remind = Remind.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def remind_params
      params.require(:remind).permit(:name, :date, :time, :contactmethod, :contactinfo, :message, :timecreated)
    end
end
