module OrdinaryCms
  class RootController < ApplicationController
    def show
      @page = Page.find_by root: true
      render 'ordinary_cms/pages/show'
    end
  end
end