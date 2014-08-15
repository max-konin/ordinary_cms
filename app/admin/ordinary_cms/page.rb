ActiveAdmin.register OrdinaryCms::Page do

  permit_params :name, seo_attributes: [ :id, :title, :description, :keywords ]

  form do |f|
    f.inputs do
      f.input :name
    end

    f.inputs name: 'Seo', for: [:seo, f.object.seo] do |s|
      s.input :title
      s.input :description
      s.input :keywords
    end
  end

end