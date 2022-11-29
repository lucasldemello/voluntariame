ActiveAdmin.register Ngo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :cnpj, :phone_number, :website, :street, :number, :district, :city, :state, :country, :email, :latitude, :longitude, activity_ids: [] 

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
      input :phone_number
      input :website
      input :email
      input :street 
      input :number 
      input :district 
      input :city
      input :state, :as => :select, :collection => BrazilianStatesHelper::STATES
    end

    inputs "Ramos de atuação" do
      f.input :activities, as: :check_boxes
    end

    inputs "Coordenadas" do
      f.input :latitude
      f.input :longitude
    end

    actions
  end
end
