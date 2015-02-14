class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :admin_notices
  has_many :fly_user_type_ratings, dependent: :destroy
  has_many :type_ratings, through: :fly_user_type_ratings, dependent: :destroy

  accepts_nested_attributes_for :fly_user_type_ratings, allow_destroy: true

  def self.checkbox_params
    [:high_school_diploma, :post_secondary_degree].concat(FLIGHT_EXPERIENCE.keys)
  end

  def self.permissible_params
    [:full_name, :birthdate, :high_school_diploma, :post_secondary_degree, :email_weekly, :email_urgent, :rating, :medical_license, :just_registered]
      .concat(FLIGHT_HOUR_TYPES.keys)
      .concat(FLIGHT_EXPERIENCE.keys)
      .concat([fly_user_type_ratings_attributes: [:id, :user_id, :type_rating_id, :issuance, :current, :pic, :_destroy]])
  end

  store_accessor :flight_time, *FLIGHT_HOUR_TYPES.keys
  store_accessor :flight_experience, *FLIGHT_EXPERIENCE.keys

  ## validations
  [:full_name, :birthdate].concat(FLIGHT_HOUR_TYPES.keys).each do |param|
    validates_presence_of param
  end

  validates :full_name, length: { maximum: 50 }

  FLIGHT_HOUR_TYPES.keys.each do |type|
    validates_numericality_of type
  end

  validates :rating, inclusion: [*RATINGS.values, ""]
  validates :medical_license, inclusion: [*MEDICAL_LICENSES.values, ""]

  checkbox_params.each do |attribute|
    validates attribute, inclusion: ["1", "0", true, false]
  end

end
