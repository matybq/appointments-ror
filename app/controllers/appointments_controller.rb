class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: %i[show edit update destroy]

  # GET /appointments or /appointments.json
  def index
    redirect_to appointments_of_date_path(selected_date: Date.today)
  end
  
  # GET /appointments/new
  def new
    @appointment = current_user.appointments.build
    @patients = current_user.patients
  end

  # GET /appointments/1/edit
  def edit
  end

  def show
  end

  def search
    @selected_date = Date.parse(params[:selected_date])
    @appointments_of_date = Appointment.where(date: @selected_date.beginning_of_day..@selected_date.end_of_day)
  end


  # POST /appointments or /appointments.json
  def create
    @appointment = current_user.appointments.build(appointment_params)


    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy!

    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:date, :time, :patient_id)
    end
end
