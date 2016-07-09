FactoryGirl.define do
  factory :post do
    title "title"
    content "content"
    subreddit_id 1
    user_id 1
    posted_by "email"
  end
end
