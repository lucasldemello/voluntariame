FactoryBot.define do
  factory :activity do
    name { Faker::Games::LeagueOfLegends.champion }
    used_count { 1 }
  end
end
