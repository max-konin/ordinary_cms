require_dependency "ordinary_cms/application_controller"

module OrdinaryCms
  class PagesController < ApplicationController
    before_action :set_page, only: [:show, :update]
    before_action ActiveAdmin.application.authentication_method, only: :update

    def show
      request.subdomain
    end

    def update
      sections_keys = params[:content].keys - [:undefined]
      sections_keys.each do |key|
        section = @page.section(key)
        section.update_attributes content: params[:content][key][:value] unless section.nil?
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
