FactoryGirl.define do
  factory :page, class: OrdinaryCms::Page  do
    sequence(:name) {|n| "page-#{n}" }
    text "some text"
  end
end