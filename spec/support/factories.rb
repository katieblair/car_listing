FactoryGirl.define do
  factory :manufacturer do
    name 'Toyota'
    country 'Japan'
  end

  factory :car do
    color 'Silver'
    year 2010
    mileage 20000

    manufacturer
  end
end
