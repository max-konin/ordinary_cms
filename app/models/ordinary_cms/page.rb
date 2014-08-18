module OrdinaryCms
  class Page
    include Mongoid::Document
    include ActsAsPage

    embeds_many :sections, class_name: 'OrdinaryCms::Section'
    accepts_nested_attributes_for :sections

    def section(name)
      sections.where(name: name).first
    end

  end
end