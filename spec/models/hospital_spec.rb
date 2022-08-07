require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it {should have_many :doctors}
    it { should have_many(:doctor_patients).through(:doctors) }
    it { should have_many(:patients).through(:doctor_patients)}
  end

  describe 'model methods' do 
    it '.total_docs' do 
      grey_sloan = Hospital.create!(name: "Grey Sloan Memorial")

      mer = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Boston University", hospital_id: grey_sloan.id)
      yang = Doctor.create!(name: "Cristina Yang", specialty: "Cardiology", university: "Stanford University", hospital_id: grey_sloan.id)
      karev = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "UCLA", hospital_id: grey_sloan.id)
      george = Doctor.create!(name: "George Omalley", specialty: "General Surgery", university: "Ohio State", hospital_id: grey_sloan.id)
      izzy = Doctor.create!(name: "Izzy Stevens", specialty: "OBGYN", university: "Kansas State", hospital_id: grey_sloan.id)

      expect(grey_sloan.total_docs).to eq(5)
    end

    it '.unique_unis' do
      grey_sloan = Hospital.create!(name: "Grey Sloan Memorial")

      mer = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Boston University", hospital_id: grey_sloan.id)
      yang = Doctor.create!(name: "Cristina Yang", specialty: "Cardiology", university: "Stanford University", hospital_id: grey_sloan.id)
      karev = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "UCLA", hospital_id: grey_sloan.id)
      george = Doctor.create!(name: "George Omalley", specialty: "General Surgery", university: "Ohio State", hospital_id: grey_sloan.id)
      izzy = Doctor.create!(name: "Izzy Stevens", specialty: "OBGYN", university: "Ohio State", hospital_id: grey_sloan.id)

      expect(grey_sloan.unique_unis).to eq([mer.university, yang.university, karev.university, george.university])
    end
  end
end
