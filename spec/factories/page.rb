FactoryGirl.define do
  factory :page do
    title 'MyString'
    description 'MyText'
    slug 'MyString'
    menu_label 'MyString'
    h1 'MyString'
    content 'MyString'
    published_at { rand(1..100).days.from_now }
    priority 1
  end
end
