# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity, type: :model do
  subject { create(:contact) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  # describe 'Associations' do
  #   it { should belong_to(:ngo) }
  # end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end
end
