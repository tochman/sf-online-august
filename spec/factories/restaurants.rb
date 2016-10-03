FactoryGirl.define do
  factory :restaurant do
    name 'MyString'
    description 'MyText'
    user {association(:user)}
  end
end
