ActiveAdmin.register Phrase do
  permit_params :text, :tag_list

  index do
    selectable_column
    id_column
    column :text
    actions
  end

  filter :text
end
