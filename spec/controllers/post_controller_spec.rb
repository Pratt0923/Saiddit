require 'rails_helper'

describe PostController do

  it 'should allow posts to be created' do
    user = create :user
    sign_in user
    create :subreddit
    post :create, {
      :post => {
        :subreddit => "new",
        :title => "title",
        :content => "content"
      }}
      get :index
      get :new
      expect(Post.count).to eq(1)
      expect(Post.first.title).to eq("title")
  end



end
