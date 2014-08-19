require 'rails_helper'

describe OrdinaryCms::PagesController do


  describe 'GET show' do
    context 'page without template' do
      before :each do
        @page = FactoryGirl.create :page
      end

      subject {get :show, {id: @page, use_route: :ordinary_cms}}

      it {should render_template('ordinary_cms/pages/show')}

      it 'assigns the requested page as @page' do
        get :show, {id: @page, use_route: :ordinary_cms}
        expect(assigns :page).to eq(@page)
      end
    end
    context 'page with template' do
      before :each do
        @page = FactoryGirl.create :page, name: 'smart'
      end

      subject {get :show, {id: @page, use_route: :ordinary_cms}}

      it {should render_template('ordinary_cms/pages/smart')}

      it 'assigns the requested page as @page' do
        get :show, {id: @page, use_route: :ordinary_cms}
        expect(assigns :page).to eq(@page)
      end
    end
  end

end