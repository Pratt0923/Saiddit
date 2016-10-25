require 'rails_helper'

describe PostController do
  setup do
  @request.env['HTTP_REFERER'] = 'http://localhost:3000/post'
end

  it 'should allow posts to be created' do
    user = create :user
    sign_in user
    create :subreddit
    post :create, params: {:post => {
        :subreddit => "new",
        :title => "title",
        :content => "content"
      }}
      get :index
      get :new
      expect(Post.count).to eq(1)
      expect(Post.first.title).to eq("title")
  end

  it 'should users to destory posts through the controller' do
    user = create :user
    sign_in user
    create :subreddit
    post :create, params: {:post => {
      :subreddit => "new",
      :title => "title",
      :content => "content"
    }}
    post :destroy, :id => 1
    expect(Post.count).to eq(0)
  end

  it 'should allow users to edit posts through controller' do
    user = create :user
    sign_in user
    create :subreddit
    post :create, params:{:post => {
      :subreddit => "new",
      :title => "title",
      :content => "content"
    }}
    get :edit, params:{:id => 1}
    post :update, params:{:id => 1, :post => {
        :subreddit => "new",
        :title => "newtitle",
        :content => "newcontent"
      }}
      expect(Post.first.title).to eq("newtitle")
      expect(Post.first.content).to eq("newcontent")
  end

  it 'should allow users to upvote posts' do
    user = create :user
    sign_in user
    create :subreddit
    post :create, params:{:post => {
      :subreddit => "new",
      :title => "title",
      :content => "content"
    }}
    post :upvote, params:{:post_id => 1}
    expect(Post.first.get_upvotes.size).to eq(1)
    expect(Post.first.get_downvotes.size).to eq(0)
  end

  it 'should allow users to downvotes posts' do
    user = create :user
    sign_in user
    create :subreddit
    post :create, params:{:post => {
      :subreddit => "new",
      :title => "title",
      :content => "content"
    }}
    post :downvote, params:{:post_id => 1}
    expect(Post.first.get_upvotes.size).to eq(0)
    expect(Post.first.get_downvotes.size).to eq(1)
  end
end
