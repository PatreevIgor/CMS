FactoryBot.define do
  factory :page do
    title 'MyString'
    description 'MyText'
    slug 'MyString'
    menu_label 'MyString'
    h1 'MyString'
    content 'MyString'
    published_at { Time.now - 1.day }
    priority 1
  end
end
