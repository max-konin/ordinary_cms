require 'rails_helper'

describe OrdinaryCms::Factories::Page do
  describe '#build' do
    before :each do
      @page_factory = FactoryGirl.create(:page_factory)
    end

    subject {@page_factory.build}

    it {should be_a OrdinaryCms::Page}
    it {expect(subject.factory).to eq(@page_factory)}
    it {expect(subject.sections.first.name).to  eq(@page_factory.sections.first.name)}
    it {expect(subject.sections.first.alias).to eq(@page_factory.sections.first.alias)}
  end
end