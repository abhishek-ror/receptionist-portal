class Doctor::PatientsController < ApplicationController
  
  before_action :registered_patients_by_days, only: :registered_patients_by_days

  require 'groupdate'	
	
  def index
    @patients = Patient.all
	end

  def registered_patients_by_days
    @patients_by_days = Patient.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day).count
    @patient_count = Patient.where("DATE(created_at) = ?", Date.today).count

    respond_to do |format|
      format.html # Render the HTML view
      format.json { render json: @patients_by_days } # Return the data as JSON
    end
  end
end
