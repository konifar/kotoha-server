ActiveAdmin.register Phrase do
  permit_params :text, :tag_list

  index do
    selectable_column
    id_column
    column :text
    column :tag_list
    actions
  end

  form do |f|
    f.inputs do
      f.input :text
      f.input :tag_list,
        label: "Tags",
        input_html: {
          data: {
            saved: f.object.tags.map{|t| {id: t.name, name: t.name}}.to_json
          },
          class: 'tag-input'
      }
    end
    f.actions
  end

  filter :text
end