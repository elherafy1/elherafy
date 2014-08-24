# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :worker do
    name "MyString"
    area "MyString"
    status "New Status"
    kind  "MyString"
     phone "MyString"
  end

  factory :mabalat, :class => Worker do
    name "MyString"
    area "MyString"
    status "New Status"
    kind  "mabalat"
     phone "MyString"
  end

    factory :naggar, :class => Worker do
    name "MyString"
    area "MyString"
    status "New Status"
    kind  "naggar"
     phone "MyString"
  end

     factory :sabak, :class => Worker do
    name "MyString"
    area "MyString"
    status "New Status"
    kind  "sabak"
     phone "MyString"
  end
end
