class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 

  def self.flight_hour_types
  	{
      total: "Total", total_pic: "Total Pilot-in-Command (PIC)", 
      multi: "Total Multi-Engine", multi_pic: "Total Multi-Engine PIC",
      turbine: "Total Turbine", tubine_pic: "Total Turbine PIC", 
      turbofan: "Total Turbofan/Turboprop", turbofan_pic: "Total Turbofan/Turboprop PIC"
    }
  end

  def self.ratings
    {atpl: "I hold an unrestricted FAA ATPL(A) including the written examination"}
  end

  def self.medical_information
  	{license: "I hold a valid ICAO class 1 medical license"}
  end

  def self.additional
  	{
      work_right: "I have the right to work in the United States of America", 
      valid_passport: "I have a valid and unrestricted passport",
  		background_check: "I can pass a FAA/TSA background check",
      drug_test: "I can pass a drug test",
      drivers_license: "I have a valid driver's license"
    }
  end

  def self.description(info)
    info.collect {|type, desc| type}
  end

  store_accessor :flight_time, *description(flight_hour_types)
  store_accessor :rating, *description(ratings)
  store_accessor :medical, *description(medical_information)
  store_accessor :additional, *description(additional)

end
