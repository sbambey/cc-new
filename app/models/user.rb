class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.checkbox_params
    [:high_school_diploma, :post_secondary_degree]
      .concat(RATINGS.keys)
      .concat(MEDICAL_INFORMATION.keys)
      .concat(ADDITIONAL.keys)
  end

  def self.permissible_params
    [:full_name, :nationality, :language, :birthdate, :high_school_diploma, :post_secondary_degree]
      .concat(FLIGHT_HOUR_TYPES.keys)
      .concat(RATINGS.keys)
      .concat(MEDICAL_INFORMATION.keys)
      .concat(ADDITIONAL.keys)
  end

  store_accessor :flight_time, *FLIGHT_HOUR_TYPES.keys
  store_accessor :rating, *RATINGS.keys
  store_accessor :medical, *MEDICAL_INFORMATION.keys
  store_accessor :additional, *ADDITIONAL.keys

  ## validations
  [:full_name, :nationality, :language, :birthdate].concat(FLIGHT_HOUR_TYPES.keys).each do |param|
    validates_presence_of param
  end

  validates :full_name, length: { maximum: 50 }

  FLIGHT_HOUR_TYPES.keys.each do |type|
    validates_numericality_of type
  end

  checkbox_params.each do |attribute|
    validates attribute, inclusion: ["1", "0", true, false]
  end

end
