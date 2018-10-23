FactoryBot.define do
  factory :artist do
    sequence(:name) {|n| "Song #{n}"}
    created_at { |n| ("#{n}".to_i*1).days.ago }
  end
end
