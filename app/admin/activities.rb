ActiveAdmin.register Activity do
  permit_params :name, :used_count
  index do
    selectable_column
    column :id
    column :name 
    column :used_count
    actions
  end
end
