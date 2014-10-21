module OrdinaryCms
  class Page
    include Mongoid::Document
    include Mongoid::Orderable
    include ActsAsPage

    field :root, type: Boolean, default: false
    field :position, type: Integer
    orderable

    belongs_to :factory, class_name: 'OrdinaryCms::Factories::Page'

    embeds_many :sections, class_name: 'OrdinaryCms::Section'
    accepts_nested_attributes_for :sections, allow_destroy: true

    def section(name)
      sections.where(name: name).first
    end

    def set_as_root!
      Page.where(root: true).update_all root: false
      self.update_attributes! root: true
    end

    def matches?(factory)
      raise ArgumentError, 'Argument is not OrdinaryCms::Factories::Page' unless factory.is_a? Factories::Page
      factory.sections.each do |s|
        return false if self.sections.where(name: s.name).empty?
      end
      true
    end
  end
end