FactoryGirl.define do
  factory :section_factory, class: OrdinaryCms::Factories::Section  do
    sequence(:name)  {|n| "section-#{n}" }
    sequence(:alias) {|n| "section-#{n}" }
  end
end