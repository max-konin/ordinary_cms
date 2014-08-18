ActiveAdmin.register OrdinaryCms::Page do

  permit_params :name, seo_attributes: [ :id, :title, :description, :keywords ],
                sections_attributes: [:id, :name, :text, :_destroy]

  member_action :mercury_update, method: :put do

  end


  index do
    selectable_column
    column :name
    column do |page|
        link_to t('edit_content'),
                "/editor#{ordinary_cms.page_path(page)}",
                data: {save_url: mercury_update_admin_ordinary_cms_page_path(page)}
    end
    default_actions
  end

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

    f.actions
  end

end