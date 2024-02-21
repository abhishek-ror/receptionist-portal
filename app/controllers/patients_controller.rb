class PatientsController < ApplicationController
  before_action :authenticate_user!
	before_action :set_patient, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource # Add this line to authorize actions

  def index
    @patients = Patient.order(:id)
  end

  def show
  end

  def new
    @patient = Patient.new
    # to handle error
    authorize! :create, @patient, message: "You are not authorized to create a new patient."
  end

  def create
    @patient = current_user.patients.build(patient_params)
    if @patient.save
      redirect_to @patient, notice: 'Patient was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Patient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to @patient, notice: 'Patient was successfully destroyed.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :gender, :age, :date_of_birth, :city, :address, :mobile_no, :user_id)
  end
end
