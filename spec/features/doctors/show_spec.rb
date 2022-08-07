require 'rails_helper'

RSpec.describe "Doctors show page" do 
   it "has all of that doctor's information including name, specialty, and university" do 
      grey_sloan = Hospital.create!(name: "Grey Sloan Memorial")

      mer = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Boston University", hospital_id: grey_sloan.id)
      yang = Doctor.create!(name: "Cristina Yang", specialty: "Cardiology", university: "Stanford University", hospital_id: grey_sloan.id)
      karev = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "UCLA", hospital_id: grey_sloan.id)

      patient1 = Patient.create!(name: "Denny Duquette", age: 37)
      patient2 = Patient.create!(name: "Sam Smith", age: 38)
      patient3 = Patient.create!(name: "Sally Omally", age: 39)

      doc_pat1 = DoctorPatient.create!(doctor_id: mer.id, patient_id: patient1.id)
      doc_pat2 = DoctorPatient.create!(doctor_id: mer.id, patient_id: patient2.id)
      doc_pat3 = DoctorPatient.create!(doctor_id: yang.id, patient_id: patient3.id)

      visit "/doctors/#{mer.id}"

      expect(page).to have_content("Name: Meredith Grey")
      expect(page).to have_content("Specialty: General Surgery")
      expect(page).to have_content("Doctorate: Boston University")
      expect(page).to_not have_content("Cristina Yang")
   end

   it "has the name of the hospital where this doctor works" do 
      grey_sloan = Hospital.create!(name: "Grey Sloan Memorial")
      mercy = Hospital.create!(name: "Mercy West")

      mer = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Boston University", hospital_id: grey_sloan.id)
      yang = Doctor.create!(name: "Cristina Yang", specialty: "Cardiology", university: "Stanford University", hospital_id: grey_sloan.id)
      karev = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "UCLA", hospital_id: grey_sloan.id)

      patient1 = Patient.create!(name: "Denny Duquette", age: 37)
      patient2 = Patient.create!(name: "Sam Smith", age: 38)
      patient3 = Patient.create!(name: "Sally Omally", age: 39)

      doc_pat1 = DoctorPatient.create!(doctor_id: mer.id, patient_id: patient1.id)
      doc_pat2 = DoctorPatient.create!(doctor_id: mer.id, patient_id: patient2.id)
      doc_pat3 = DoctorPatient.create!(doctor_id: yang.id, patient_id: patient3.id)

      visit "/doctors/#{mer.id}"

      expect(page).to have_content("Grey Sloan Memorial")
      expect(page).to_not have_content("Mercy West")
   end

   it "has the names of all the patients this doctor has" do 
      grey_sloan = Hospital.create!(name: "Grey Sloan Memorial")

      mer = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Boston University", hospital_id: grey_sloan.id)
      yang = Doctor.create!(name: "Cristina Yang", specialty: "Cardiology", university: "Stanford University", hospital_id: grey_sloan.id)
      karev = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "UCLA", hospital_id: grey_sloan.id)

      patient1 = Patient.create!(name: "Denny Duquette", age: 37)
      patient2 = Patient.create!(name: "Sam Smith", age: 38)
      patient3 = Patient.create!(name: "Sally Omally", age: 39)

      doc_pat1 = DoctorPatient.create!(doctor_id: mer.id, patient_id: patient1.id)
      doc_pat2 = DoctorPatient.create!(doctor_id: mer.id, patient_id: patient2.id)
      doc_pat3 = DoctorPatient.create!(doctor_id: yang.id, patient_id: patient3.id)

      visit "/doctors/#{mer.id}"

      expect(page).to have_content("Denny Duquette")
      expect(page).to have_content("Sam Smith")
      expect(page).to_not have_content("Sally Omally")
   end
end
