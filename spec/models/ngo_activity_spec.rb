require 'rails_helper'

RSpec.describe NgoActivity, type: :model do
  subject { create(:ngo_activity) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  describe 'Associations' do
    it { should belong_to(:ngo) }
    it { should belong_to(:activity) }
  end
end
