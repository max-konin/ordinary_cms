module OrdinaryCms
  class Section
    include Mongoid::Document

    field :name
    field :alias
    field :content

    embedded_in :ordinary_cms_page

    validates :name, uniqueness: true, presence: true

    def self.[](key)
      find_by name: key
    end
  end
end