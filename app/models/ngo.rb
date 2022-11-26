# frozen_string_literal: true

class Ngo < ApplicationRecord
  has_many :contacts
  has_many :ngo_activities
  has_many :activities, through: :ngo_activities

  validates :name, :description, :website, :street, :district, :city, :state, :email, presence: true
  validates :name, length: { minimum: 5 }
  validates :description, length: { maximum: 500 }
  validates :cnpj, length: { is: 14 }, allow_blank: true

  geocoded_by :address
  after_validation :geocode

  before_save :set_country

  private

  def address
    [street, number, district, city, state, country].compact.join(', ')
  end

  def set_country
    country = 'Brasil'
  end
end
