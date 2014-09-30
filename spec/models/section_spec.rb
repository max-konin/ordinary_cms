require 'rails_helper'

describe OrdinaryCms::Section do
  it 'has uniq name' do
    page = FactoryGirl.create :page
    page.sections.create name: 'name'
    section = page.sections.new name: 'name'
    expect(section.valid?).to eq(false)
  end

  describe '.render' do
    let (:section) {(FactoryGirl.create :page).sections.build name: 'sec1', alias: 'sec', content: '<p>content<\p>'}

    context 'pass :alias' do
      subject {section.render :alias}
      it {should eq("<span data-mercury=\"simple\" id=\"sec1_title\">sec</span>")}
    end

    context 'pass :content' do
      subject {section.render :content}
      it {should eq( "<div class=\"section\" data-mercury=\"full\" id=\"sec1\"><p>content<\\p></div>")}
    end

    context 'pass nothing' do
      subject {section.render}
      it {should eq( "<div class=\"section\" data-mercury=\"full\" id=\"sec1\"><p>content<\\p></div>")}
    end

  end
end