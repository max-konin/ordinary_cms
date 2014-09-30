require_dependency "ordinary_cms/application_controller"
require_dependency 'ordinary_cms/concerns/smart_pages_render'

module OrdinaryCms
  class RootController < ApplicationController
    include SmartPagesRender
    def show
      @pages = OrdinaryCms::Factories::Page.where(name: 'text_page').first.pages.order('position asc')
      @page = Page.find_by root: true
      smart_render 'root'
    end
  end
end