# frozen_string_literal: true

class Ngo < ApplicationRecord
  has_many :contacts
  has_many :ngo_activities
  has_many :activities, through: :ngo_activities, dependent: :destroy

  validates :name, :description, :website, :street, :district, :city, :state, :email, presence: true
  validates :name, length: { minimum: 5 }
  validates :description, length: { maximum: 1000 }
  validates :cnpj, length: { is: 14 }, allow_blank: true

  geocoded_by :address
  after_validation :geocode
  before_validation :set_country

  def address
    [street, number, district, city, state, country].compact.join(', ')
  end

  def short_address
    [street, number, district].compact.join(', ')
  end

  def activities_description
    activities.map { |x| x.name }.compact.join(', ')
  end

  def self.search_ngos(location = nil)
    return [] if location.nil?

    # procura por estado
    ngos = search_ngos_by_state(location)

    return ngos if ngos.present?

    # procura por cidade
    ngos = search_ngos_by_location(location)
  end

  private

  def self.search_ngos_by_location(location = nil)
    return [] if location.nil?

    search_ngos_by_state(location)

    ngos = Ngo.near(location)
  end

  def self.search_ngos_by_state(location)
    state = BrazilianStatesHelper::STATES.find { |_k, v| v.upcase.include? location.upcase }&.last
    state = BrazilianStatesHelper::STATES.find { |k, _v| k.to_s.include? location.upcase }&.last if state.nil?

    return unless state.present?

    Ngo.where(state:)
  end

  def set_country
    country = 'Brasil'
  end
end
