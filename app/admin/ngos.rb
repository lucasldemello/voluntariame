ActiveAdmin.register Ngo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :cnpj, :website, :street, :number, :district, :city, :state, :country, :email
 
  form do |f|
    f.inputs :name, :description, :cnpj, :website, :street, :number, :district, :city, :email
    
    # f.inputs "Categories" do
    #   f.input :categories, as: :check_boxes
    # end
    actions
  end
  
end
