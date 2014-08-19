require 'rails_helper'

describe OrdinaryCms::Factories::Section do
  describe '#build' do
    before :each do
      @section_factory = FactoryGirl.create(:page_factory).sections.first
    end

    subject {@section_factory.build}

    it {should be_a OrdinaryCms::Section}
    it {expect(subject.name).to  eq(@section_factory.name)}
    it {expect(subject.alias).to eq(@section_factory.alias)}
  end
end