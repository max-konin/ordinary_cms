require_dependency "ordinary_cms/application_controller"

module OrdinaryCms
  class PagesController < ApplicationController
    before_action :set_page, only: [:show, :update]

    def show
    end

    # PATCH/PUT /pages/1
    def update
      if @page.update(page_params)
        redirect_to @page, notice: 'Page was successfully updated.'
      else
        render :edit
      end
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
