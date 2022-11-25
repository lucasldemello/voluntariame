require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject { create(:contact) }
  it "is valid with valid attributes" do 
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should belong_to(:ngo) }
  end

  describe "validations" do
    it{ is_expected.to validate_presence_of :name }    
    it{ is_expected.to validate_presence_of :cellphone }    
    it { should validate_length_of(:name).is_at_least(5) }
  end
end
