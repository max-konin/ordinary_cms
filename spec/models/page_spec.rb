require 'rails_helper'

describe OrdinaryCms::Page do

  describe '#section' do
    before :each do
      @page = FactoryGirl.create :page
      2.times { |i| @page.sections.create name: i.to_s }
    end

    it 'return section by name' do
      expect(@page.section '1').to eq(@page.sections.find_by name: '1')
    end

    it 'return nil if section not found' do
      expect(@page.section 'notfound').to be_nil
    end
  end
end