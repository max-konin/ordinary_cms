module OrdinaryCms
  class Section
    include Mongoid::Document
    include ActionView::Helpers::OutputSafetyHelper

    field :name
    field :alias
    field :content

    embedded_in :ordinary_cms_page

    validates :name, uniqueness: true, presence: true

    def self.[](key)
      find_by name: key
    end

    def render(what=:content)
      if what == :alias
        ActionController::Base.helpers.content_tag(:span, 'data-mercury' => 'simple') {self.alias}
      else
        ActionController::Base.helpers.content_tag(
            :div,
            {class: 'section', id: self.name, 'data-mercury' => 'full'}) {raw self.content}
      end

    end
  end
end