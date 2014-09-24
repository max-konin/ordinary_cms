module OrdinaryCms
  module Factories
    class Page
      include Mongoid::Document

      field :name

      embeds_many :sections, class_name: 'OrdinaryCms::Factories::Section'
      validates :name, presence: true, uniqueness: true

      def build(params = {})
        page = OrdinaryCms::Page.new params
        sections.each {|s| page.sections << s.build}
        page.factory = self
        page
      end
    end
  end
end