FactoryGirl.define do
  factory :reply do
    user "email"
    content "this is a reply"
    comment_id 1
  end
end
