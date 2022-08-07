class DoctorPatientsController < ApplicationController 
   def destroy
      doctor_patient = DoctorPatient.where(doctor_id: params[:id], patient_id: params[:patient_id]).first
      DoctorPatient.destroy(doctor_patient.id)
      redirect_to "/doctors/#{params[:id]}"
   end
end