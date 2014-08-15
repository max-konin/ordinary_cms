require 'rails_helper'

describe OrdinaryCms::PagesController do

  before :each do
    @page = FactoryGirl.create :page
  end

  describe 'GET show' do
    it 'assigns the requested page as @page' do
      get :show, {id: @page, use_route: :ordinary_cms}
      expect(assigns :page).to eq(@page)
    end
  end

end