FactoryGirl.define do
  factory :fly_user_type_rating, class: FlyUserTypeRating do
    issuance Time.now
    current true
    pic true
    time_in_type 100
    user
    fly
  end
end