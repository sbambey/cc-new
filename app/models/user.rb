class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.extract_attribute(pairs)
    pairs.collect {|attribute, description| attribute}
  end

  def self.checkbox_params
    extract_attribute(RATINGS)
      .concat(extract_attribute(MEDICAL_INFORMATION))
      .concat(extract_attribute(ADDITIONAL))
  end

  def self.permissible_params
    [:full_name, :nationality, :language, :birthdate, :high_school_diploma, :post_secondary_degree]
      .concat(extract_attribute(FLIGHT_HOUR_TYPES))
      .concat(extract_attribute(RATINGS))
      .concat(extract_attribute(MEDICAL_INFORMATION))
      .concat(extract_attribute(ADDITIONAL))
  end

  store_accessor :flight_time, *extract_attribute(FLIGHT_HOUR_TYPES)
  store_accessor :rating, *extract_attribute(RATINGS)
  store_accessor :medical, *extract_attribute(MEDICAL_INFORMATION)
  store_accessor :additional, *extract_attribute(ADDITIONAL)

  ## validations
  permissible_params.each do |param|
    validates_presence_of param
  end

  validates :full_name, length: { maximum: 50 }

  extract_attribute(FLIGHT_HOUR_TYPES).each do |type|
    validates_numericality_of type
  end

  checkbox_params.each do |attribute|
    validates attribute, inclusion: ["1", "0"]
  end

end
