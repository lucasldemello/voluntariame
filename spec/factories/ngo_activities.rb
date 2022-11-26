FactoryBot.define do
  factory :ngo_activity do
    ngo { create(:ngo) }
    activity { create(:activity) }
  end
end
