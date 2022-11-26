# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity, type: :model do
  subject { create(:activity) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should have_many(:ngos) }
    it { should have_many(:ngo_activities) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end
end
