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

  describe '#set_as_root' do
    before :each do
      @old_root = FactoryGirl.create :page, root: true
      @new_root = FactoryGirl.create :page
    end

    it 'return true' do
      expect(@new_root.set_as_root!).to be_truthy
    end

    it 'set @new_root as root' do
      expect {@new_root.set_as_root!}.to change{@new_root.reload.root?}.from(false).to(true)
    end

    it 'set @new_root as not root' do
      expect {@old_root.set_as_root!}.to change{@old_root.reload.root?}.from(true).to(false)
    end
  end

  describe '.matches?' do
    let(:factory) {FactoryGirl.create :page_factory}

    it 'return true if page has all section such as in factory' do
      page = factory.build
      expect(page.matches? factory).to be_truthy
    end

    it 'return false else' do
      page = FactoryGirl.create :page
      expect(page.matches? factory).to be_falsey
    end

    it 'raise ArgumentError if passed not factory' do
      page = FactoryGirl.create :page
      expect{page.matches? Object.new}.to raise_error(ArgumentError)
    end

  end
end