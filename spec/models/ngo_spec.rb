# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ngo, type: :model do
  subject { create(:ngo) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should have_many(:contacts) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :website }
    it { is_expected.to validate_presence_of :street }
    it { is_expected.to validate_presence_of :district }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :state }
    it { is_expected.to validate_presence_of :email }
    it { should validate_length_of(:name).is_at_least(5) }
    it { should validate_length_of(:description).is_at_most(500) }
    it { should validate_length_of(:cnpj).is_equal_to(14) }
  end
end
