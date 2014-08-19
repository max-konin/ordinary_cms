require 'rails_helper'

describe OrdinaryCms::RootController do

  before :each do
    @page = FactoryGirl.create :page
  end

  describe 'GET show' do
    context 'root exists' do
      subject {  get :show, {use_route: :ordinary_cms} }
      before :each do
        @root = FactoryGirl.create :page, root: true
      end

      it 'assigns root page as @page' do
        get :show, {use_route: :ordinary_cms}
        expect(assigns :page).to eq(@root)
      end

      it {should render_template('ordinary_cms/pages/show') }
    end

    context 'root does not exist' do
      it 'raise not found' do
        expect{get :show, {use_route: :ordinary_cms}}.to raise_error{Mongoid::Errors::DocumentNotFound}
      end
    end
  end

end