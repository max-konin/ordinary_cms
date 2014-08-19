module OrdinaryCms
  module SmartPagesRender
    extend ActiveSupport::Concern

    def smart_render(page_name)
      render template_exists?("ordinary_cms/pages/#{page_name}") ? "ordinary_cms/pages/#{page_name}" : 'ordinary_cms/pages/show'
    end
  end
end