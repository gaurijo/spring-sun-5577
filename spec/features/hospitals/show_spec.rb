require 'rails_helper'

RSpec.describe "Hospital Show Page" do 
   it "has the hospital's name, number of doctors that work there, and a unique list of universities attended" do 
      grey_sloan = Hospital.create!(name: "Grey Sloan Memorial")
      mercy = Hospital.create!(name: "Mercy West")

      mer = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Boston University", hospital_id: grey_sloan.id)
      yang = Doctor.create!(name: "Cristina Yang", specialty: "Cardiology", university: "Stanford University", hospital_id: grey_sloan.id)
      karev = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "UCLA", hospital_id: grey_sloan.id)
      george = Doctor.create!(name: "George Omalley", specialty: "General Surgery", university: "Ohio State", hospital_id: grey_sloan.id)
      izzy = Doctor.create!(name: "Izzy Stevens", specialty: "OBGYN", university: "Ohio State", hospital_id: grey_sloan.id)

      visit "/hospitals/#{grey_sloan.id}"

      expect(page).to have_content("Grey Sloan Memorial")
      expect(page).to have_content("Doctors: 5")
      expect(page).to have_content("Boston University")
      expect(page).to have_content("Stanford University")
      expect(page).to have_content("UCLA")
      expect(page).to have_content("Ohio State")
   end
end
