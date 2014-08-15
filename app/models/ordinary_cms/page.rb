module OrdinaryCms
  class Page
    include Mongoid::Document
    include ActsAsPage

    embeds_many :sections, class_name: 'OrdinaryCms::Section'
    accepts_nested_attributes_for :sections

    def section(name)
      sections.find_by name: name
    end
  end
end