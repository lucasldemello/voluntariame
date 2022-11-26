ActiveAdmin.register Ngo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :cnpj, :website, :street, :number, :district, :city, :state, :country, :email

  filter :name
  filter :verified
  
  index do
    selectable_column
    column :name 
    column :verified 
    column :email
    actions
  end

  form title: 'Cadastro' do |f|
    inputs 'Dados Básicos' do 
      input :name 
      input :description
      input :cnpj
      input :website
      input :email
      input :street 
      input :number 
      input :district 
      input :city
      # f.inputs "Categories" do
      #   f.input :categories, as: :check_boxes
      # end
      input :state, :as => :select, :collection => BrazilianStatesHelper::STATES
    end
    actions
  end

  
  
end
