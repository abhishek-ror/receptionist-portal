class Doctor::PatientsController < ApplicationController
  
  before_action :registered_patients_by_days, only: :registered_patients_by_days

  require 'groupdate'	
	
  def index
    @patients = Patient.all
	end

  def registered_patients_by_days
    @patients_by_days = Patient.group_by_day(:created_at).count
  end
end
