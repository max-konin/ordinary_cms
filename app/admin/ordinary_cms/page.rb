ActiveAdmin.register OrdinaryCms::Page do

  permit_params :name, seo_attributes: [ :id, :title, :description, :keywords ],
                sections_attributes: [:id, :name, :text, :_destroy]

  form do |f|
    f.inputs do
      f.input :name
      f.has_many :sections, allow_destroy: true do |section|
        section.input :name
        section.input :alias
        section.input :content, as: :text
      end
    end

    f.inputs name: 'Seo', for: [:seo, f.object.seo] do |s|
      s.input :title
      s.input :description
      s.input :keywords
    end
  end

end