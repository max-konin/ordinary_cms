FactoryGirl.define do
  factory :page_factory, class: OrdinaryCms::Factories::Page  do
    sequence(:name) {|n| "page-#{n}" }

    sections {[FactoryGirl.build(:section_factory)]}
  end
end