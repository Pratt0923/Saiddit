require 'rails_helper'

def create_all_and_sign_user_in
  user = create :user
  sign_in user
  create :subreddit
  create :post
  create :comment
  create :reply
end

describe ReplyController do
  it 'lets to find the comments that they wish to reply to' do
    create_all_and_sign_user_in
    get :index, params: {:comment_id => 1, :post_id => 1}
    expect(Comment.first.comment).to eq("comment")
  end

  it 'lets users create replies' do
    create_all_and_sign_user_in
    post :create, params:{:post_id=>1, :comment_id=>1, :reply=>{:content=>"reply"}}
    expect(Reply.last.content).to eq("reply")
    expect(Reply.count).to eq(2)
  end

  it 'lets users destroy replies through the controller' do
    create_all_and_sign_user_in
    create :reply
    post :destroy, params:{:id => 2, :post_id => 1, :comment_id => 1}
    expect(Reply.count).to eq(1)
  end

  it 'lets the edit controller find the right reply' do
    create_all_and_sign_user_in
    get :edit, params:{:id => 1, :post_id => 1, :comment_id => 1}
    expect(Reply.find(1).content).to eq("this is a reply")
  end

  it 'lets users update their replies' do
    create_all_and_sign_user_in
    post :update, params:{
      :id => 1,
      :post_id => 1,
      :comment_id => 1,
      :reply => {
        :content => "this is new content"
      }}
      expect(Reply.first.content).to eq("this is new content")
  end
end
