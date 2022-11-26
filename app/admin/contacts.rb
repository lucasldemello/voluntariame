ActiveAdmin.register Contact do
  permit_params do
    permitted = [:name, :phone, :cellphone, :instagram, :ngo_id]
    #permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  filter :ngo
  filter :name

  index do
    selectable_column
    column :ngo
    column :name 
    column :phone
    column :cellphone
    column :instagram
    actions
  end

  form title: 'Cadastro' do |f|
    inputs 'Dados Básicos' do 
      input :ngo 
      input :name
      input :phone
      input :cellphone
      input :instagram
      # f.inputs "Categories" do
      #   f.input :categories, as: :check_boxes
      # end
    end
    actions
  end
  
end
