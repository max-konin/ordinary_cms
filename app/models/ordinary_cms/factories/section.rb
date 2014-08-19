module OrdinaryCms
  module Factories
    class Section
      include Mongoid::Document

      field :name
      field :alias

      embedded_in :ordinary_cms_factories_page

      validates :name, presence: true, uniqueness: true

      def build
        OrdinaryCms::Section.new name: name, alias: self.alias
      end
    end
  end
end