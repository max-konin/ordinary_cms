require 'rails_helper'

describe Admin::OrdinaryCmsPagesController do

  RSpec::Matchers.define :be_created_by do |factory|
    match do |page|
      return false unless page.is_a?(OrdinaryCms::Page) && factory.is_a?(OrdinaryCms::Factories::Page)
      page.matches? factory
    end
  end

  before :each do
    @admin = AdminUser.create email: 'admin@exmple.com', password: 'password'
    sign_in @admin
  end

  describe 'POST create' do
    context 'with factory' do
      let(:valid_params) {{name: 'page-1', factory: @factory}}
      before :each do
        @factory = FactoryGirl.create :page_factory
      end

      it 'creates new OrdinaryCms::Page' do
        expect {
          post :create, ordinary_cms_page: valid_params
        }.to change(OrdinaryCms::Page, :count).by(1)
      end

      it 'creates sections in page such as in @factory' do
        post :create, ordinary_cms_page: valid_params
        expect(OrdinaryCms::Page.last).to be_created_by @factory
      end
    end

    context 'without factory' do
      let(:valid_params) {{name: 'page-1'}}
      before :each do
        @factory = FactoryGirl.create :page_factory
      end

      it 'creates new OrdinaryCms::Page' do
        expect {
          post :create, ordinary_cms_page: valid_params
        }.to change(OrdinaryCms::Page, :count).by(1)
      end

      it 'creates sections in page not such as in @factory' do
        post :create, ordinary_cms_page: valid_params
        expect(OrdinaryCms::Page.last).not_to be_created_by @factory
      end
    end
  end
end