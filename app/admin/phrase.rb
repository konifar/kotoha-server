ActiveAdmin.register Phrase do
  permit_params :text, :tag_list

  index do
    selectable_column
    id_column
    column :text
    column :tag_list
    actions
  end

  show do
    attributes_table do
      row :text
      row :tag_list
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :text
      f.input :tag_list,
        label: "Tags",
        input_html: {
          data: {
            saved: f.object.tags.map{|t| {name: t.name}}.to_json
          },
          value: f.object.tags.map{|t| t.name}.join(","),
          class: 'tag-input'
      }
    end
    f.actions
  end

  filter :text
end
