module OrdinaryCms
  module Factories
    class Page
      include Mongoid::Document

      field :name

      embeds_many :sections, class_name: 'OrdinaryCms::Factories::Section'
      validates :name, presence: true, uniqueness: true

      def build
        page = OrdinaryCms::Page.new name: name
        sections.each {|s| page.sections << s.build}
        page
      end
    end
  end
end