require_dependency "ordinary_cms/application_controller"
require_dependency 'ordinary_cms/concerns/smart_pages_render'

module OrdinaryCms
  class RootController < ApplicationController
    include SmartPagesRender
    def show
      @page = Page.find_by root: true
      smart_render 'root'
    end
  end
end