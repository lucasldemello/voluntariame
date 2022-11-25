class Contact < ApplicationRecord
  belongs_to :ngo

  validates :name, :cellphone, presence: true
  validates :name, length: { minimum: 5}

end
