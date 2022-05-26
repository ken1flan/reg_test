FactoryBot.define do
  factory :article do
    sequence (:title) { |n| "title#{n}" }
    sequence (:body) { |n| "body#{n}\n#{'a' * 32}\n#{'b' * 32}" }
  end
end
