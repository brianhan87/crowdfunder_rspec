# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pledge do
    user_id 
    project_id 
    amount 100
  end
end
