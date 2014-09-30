require_dependency "ordinary_cms/application_controller"
require_dependency 'ordinary_cms/concerns/smart_pages_render'
module OrdinaryCms
  class PagesController < ApplicationController
    include SmartPagesRender

    before_action :set_page, only: [:show, :update]
    before_action ActiveAdmin.application.authentication_method, only: :update

    def show
      smart_render(@page.slug)
    end

    def update
      sections_keys = params[:content].keys - [:undefined]
      sections_keys.each do |key|
        section_name = key.gsub '_title', ''
        attr = (section_name == key) ? 'content' : 'alias'
        section = @page.section(section_name)
        section.update_attributes attr => params[:content][key][:value] unless section.nil?
      end
      render text: ''
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def page_params
        []
      end
  end
end
