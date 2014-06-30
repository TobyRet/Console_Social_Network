FactoryGirl.define do
  factory :alice, class: User do
    name "Alice"
    initialize_with { new(name) }
  end

  factory :bob, class: User do
    name "Bob"
    initialize_with { new(name) }
  end

  factory :charlie, class: User do
    name "Charlie"
    initialize_with { new(name) }
  end
end
