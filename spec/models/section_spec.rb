require 'rails_helper'

describe OrdinaryCms::Section do
  it 'has uniq name' do
    page = FactoryGirl.create :page
    page.sections.create name: 'name'
    section = page.sections.new name: 'name'
    expect(section.valid?).to eq(false)
  end
end