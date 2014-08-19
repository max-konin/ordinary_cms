module OrdinaryCms
  class Page
    include Mongoid::Document
    include ActsAsPage

    field :root, type: Boolean, default: false

    embeds_many :sections, class_name: 'OrdinaryCms::Section'
    accepts_nested_attributes_for :sections

    def section(name)
      sections.where(name: name).first
    end

    def set_as_root!
      Page.where(root: true).update_all root: false
      self.update_attributes! root: true
    end
  end
end