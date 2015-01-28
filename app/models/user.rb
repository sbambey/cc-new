# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  full_name              :string
#  birthdate              :date
#  nationality            :string
#  language               :string
#  high_school_diploma    :boolean
#  post_secondary_degree  :boolean
#  flight_time            :hstore
#  rating                 :hstore
#  medical                :hstore
#  additional             :hstore
#  created_at             :datetime
#  updated_at             :datetime
#  admin                  :boolean
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :admin_notices

  def self.checkbox_params
    [:high_school_diploma, :post_secondary_degree].concat(FLIGHT_EXPERIENCE.keys)
  end

  def self.permissible_params
    [:full_name, :birthdate, :high_school_diploma, :post_secondary_degree, :rating, :medical_license]
      .concat(FLIGHT_HOUR_TYPES.keys)
      .concat(FLIGHT_EXPERIENCE.keys)
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
