class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.flight_hour_types
  	{
      total_time: "Total Time", total_pic_time: "Total Pilot-in-Command (PIC)", 
      multi_time: "Total Multi-Engine", multi_pic_time: "Total Multi-Engine PIC",
      turbine_time: "Total Turbine", tubine_pic_time: "Total Turbine PIC", 
      turbofan_time: "Total Turbofan/Turboprop", turbofan_pic_time: "Total Turbofan/Turboprop PIC"
    }
  end

  def self.ratings
    {atpl: "I hold an unrestricted FAA ATPL(A) including the written examination"}
  end

  def self.medical_information
  	{medical_license: "I hold a valid ICAO class 1 medical license"}
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

  def self.get_method(pairs)
    pairs.collect {|method, desc| method}
  end

  store_accessor :flight_time, *get_method(flight_hour_types)
  store_accessor :rating, *get_method(ratings)
  store_accessor :medical, *get_method(medical_information)
  store_accessor :additional, *get_method(additional)

  get_method(flight_hour_types).each do |method|
    validates_presence_of method
  end

  def self.get_permissible_params
    [:full_name, :nationality, :language, :birthdate, :high_school_diploma, :post_secondary_degree]
      .concat(get_method(flight_hour_types))
      .concat(get_method(ratings))
      .concat(get_method(medical_information))
      .concat(get_method(additional))
  end

end
